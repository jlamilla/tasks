
import 'package:either_dart/either.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/data_source/tasks_data_source_local.dart';
import 'package:task/app/domain/repositories/task_data_repository_local.dart';
import 'package:task/core/config/error/error.dart';
import 'package:task/core/config/error/exception.dart';
import 'package:task/core/config/error/failure.dart';

class TaskRepositoryLocalImpl implements TasksRepositoryLocal {

  TaskRepositoryLocalImpl({
    required TasksLocalDataSource taskLocalDataSource,
  }): _localDataSource = taskLocalDataSource;

  final TasksLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final List<Task> response = await _localDataSource.getTasks();
      return Right<Failure, List<Task>>(response);
    } on Failure catch (error) {
      return Left<Failure, List<Task>>(error);
    } on Error catch (error) {
      return Left<Failure, List<Task>>(ErrorFailure.decode(error));
    } on Exception catch (error) {
      return Left<Failure, List<Task>>(ExceptionFailure.decode(error));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(Task params) async {
    try {
      final bool response = await _localDataSource.deleteTaskById(params);
      return Right<Failure, bool>(response);
    } on Failure catch (error) {
      return Left<Failure, bool>(error);
    } on Error catch (error) {
      return Left<Failure, bool>(ErrorFailure.decode(error));
    } on Exception catch (error) {
      return Left<Failure, bool>(ExceptionFailure.decode(error));
    }
  }

  @override
  Future<Either<Failure, bool>> saveTaskById(Task params) async {
    try {
      final bool response = await _localDataSource.saveTaskById(params);
      return Right<Failure, bool>(response);
    } on Failure catch (error) {
      return Left<Failure, bool>(error);
    } on Error catch (error) {
      return Left<Failure, bool>(ErrorFailure.decode(error));
    } on Exception catch (error) {
      return Left<Failure, bool>(ExceptionFailure.decode(error));
    }
  }

}
