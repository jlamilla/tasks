import 'package:task/app/data/models/local/local_storage_response.dart';

abstract class ILocalStorage {
  Future<LocalStorageResponse<void>> openBox<T>({
    required String boxName,
  });

  Future<LocalStorageResponse<void>> closeBox<T>({
    required String boxName,
  });

  LocalStorageResponse<T?> getElementById<T>({
    required String boxName,
    required String id,
  });

  LocalStorageResponse<List<T>> getList<T>({
    required String boxName,
  });

  Future<LocalStorageResponse<void>> putElementById<T>({
    required String id,
    required String boxName,
    required T value,
  });

  Future<LocalStorageResponse<void>> putElement<T>({
    required String boxName,
    required T value,
  });

  Future<LocalStorageResponse<void>> deleteById<T>({
    required String boxName,
    required String id,
  });
  
  Future<LocalStorageResponse<void>> deleteBoxElement<T>({
    required String boxName,
  });
}
