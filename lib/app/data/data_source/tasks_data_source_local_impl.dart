import 'package:hive/hive.dart';
import 'package:task/app/data/models/local/local_storage_response.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/data_source/tasks_data_source_local.dart';
import 'package:task/core/config/error/error.dart';
import 'package:task/core/config/error/exception.dart';
import 'package:task/core/services/center_local_storage.dart';
import 'package:task/core/types/hive/hive_names.dart';

class TasksDataSourceLocalImpl implements TasksLocalDataSource {

  TasksDataSourceLocalImpl({required CenterLocalStorage local}): _local = local;

  final CenterLocalStorage _local;

  @override
  Future<List<Task>> getTasks() async {
    try {
      await _local.openBox<Task>( boxName: HiveName.task);
      final LocalStorageResponse<List<Task>> response = _local.getList<Task>( 
        boxName: HiveName.task,
      );
      await _local.closeBox<Task>(boxName: HiveName.task);
      if (response.isSuccess) {
        return response.result ?? <Task>[];
      } else {
        throw HiveFailure.decode(HiveError(response.message));
      }
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> saveTaskById(Task request) async {
    try {
      await _local.openBox<Task?>(boxName: HiveName.task);
      await _local.deleteById<Task?>( id: request.id, boxName: HiveName.task);
      final LocalStorageResponse<void> response = await _local.putElementById<Task?>(
        id: request.id,
        boxName: HiveName.task,
        value: request,
      );
      await _local.closeBox<Task?>(boxName: HiveName.task);
      if (response.isSuccess) {
        return true;
      } else {
        throw HiveFailure.decode(HiveError(response.message));
      }
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<bool> deleteTaskById(Task request) async {
    try {
      await _local.openBox<Task?>(boxName: HiveName.task);
      final LocalStorageResponse<void> response = await _local.deleteById<Task?>( id: request.id, boxName: HiveName.task);
      await _local.closeBox<Task?>(boxName: HiveName.task);
      return response.isSuccess;
    } on HiveError catch (error) {
      throw HiveFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  } 
}
