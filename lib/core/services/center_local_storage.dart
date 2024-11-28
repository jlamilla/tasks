import 'package:hive/hive.dart';
import 'package:task/app/data/models/local/local_storage_response.dart';
import 'package:task/core/types/hive/local_storage_hive.dart';

class CenterLocalStorage implements ILocalStorage {
  
  CenterLocalStorage({HiveInterface? hive}) : _hive = hive ?? Hive;
  final HiveInterface _hive;

  @override
  Future<LocalStorageResponse<void>> openBox<T>({required String boxName}) async {
    try {
      if (_hive.isBoxOpen(boxName)) {
        return LocalStorageResponse<void>(
            isSuccess: false, message: 'Box $boxName is already open.');
      } else {
        await Hive.openBox<T>(
          boxName,
          compactionStrategy: (int entries, int deletedEntries) {
            return deletedEntries > 50;
          },
        );
        return LocalStorageResponse<void>(
          isSuccess: true,
        );
      }
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: false,
        message: 'Error opening box: $e',
      );
    }
  }

  @override
  Future<LocalStorageResponse<void>> closeBox<T>({required String boxName}) async {
    try {
      if (_hive.isBoxOpen(boxName)) {
        await Hive.box<T>(boxName).close();
        return LocalStorageResponse<void>(
          isSuccess: true,
        );
      } else {
        return LocalStorageResponse<void>(
          isSuccess: false,
          message: 'Box $boxName is already closed.',
        );
      }
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: false,
        message: 'Error closing box: $e',
      );
    }
  }

  @override
  LocalStorageResponse<T?> getElementById<T>({required String boxName, required String id}) {
    try {
      final Box<T> box = _hive.box<T>(boxName);
      if (box.containsKey(id)) {
        final T? existingObject = box.get(id);
        if (existingObject != null) {
          return LocalStorageResponse<T?>(
            isSuccess: true,
            result: existingObject,
          );
        } else {
          return LocalStorageResponse<T?>(
            isSuccess: false,
            message: 'The object with Id $id not exits in the box $boxName.',
          );
        }
      } else {
        return LocalStorageResponse<T?>(
          isSuccess: false,
          message: 'The object with Id $id not exits in the box $boxName.',
        );
      }
    } catch (e) {
      return LocalStorageResponse<T?>(
        isSuccess: false,
        message: 'Error getting from box: $e',
      );
    }
  }

  @override
  LocalStorageResponse<List<T>> getList<T>({required String boxName}) {
    try {
      return LocalStorageResponse<List<T>>(
        isSuccess: true,
        keys: _hive.box<T>(boxName).keys.map((dynamic key) => key.toString()).toList(),
        result: _hive.box<T>(boxName).values.toList(),
      );
    } catch (e) {
      return LocalStorageResponse<List<T>>(
        isSuccess: false,
        message: 'Error getting from box: $e',
      );
    }
  }

  @override
  Future<LocalStorageResponse<void>> putElementById<T>({required String id, required String boxName, required T value}) async {
    try {
      final Box<T> box = _hive.box<T>(boxName);
      if (box.containsKey(id)) {
        final T? existingObject = box.get(id);
        if (existingObject != null && existingObject != value) {
          await box.put(id, value);
        }
        return LocalStorageResponse<void>(
          isSuccess: true,
        );
      } else {
        await box.put(id, value);
        return LocalStorageResponse<void>(
          isSuccess: true,
        );
      }
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: false,
        message: 'Error putting item: $e',
      );
    }
  }

  @override
  Future<LocalStorageResponse<void>> putElement<T>({required String boxName, required T value}) async {
    try {
      final Box<T> box = _hive.box<T>(boxName);
      if (box.isEmpty) {
        final int key = await box.add(value);
        return LocalStorageResponse<void>(
          isSuccess: key > -1,
        );
      } else {
        final int elements = box.values.length;
        await box.add(value);
        final int elementsUpdate = box.values.length;
        return LocalStorageResponse<void>(
          isSuccess: elementsUpdate > elements,
        );
      }
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: false,
        message: 'Error putting item: $e',
      );
    }
  }

  @override
  Future<LocalStorageResponse<void>> deleteById<T>({required String boxName, required String id}) async {
    try {
      await _hive.box<T>(boxName).delete(id);
      return LocalStorageResponse<void>(
        isSuccess: true,
      );
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: true,
        message: 'Error deleting item: $e',
      );
    }
  }

  @override
  Future<LocalStorageResponse<void>> deleteBoxElement<T>({required String boxName}) async {
    try {
      await _hive.box<T>(boxName).clear();
      return LocalStorageResponse<void>(
        isSuccess: true,
      );
    } catch (e) {
      return LocalStorageResponse<void>(
        isSuccess: true,
        message: 'Error deleting item: $e',
      );
    }
  }
}
