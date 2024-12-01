
import 'package:either_dart/either.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/core/config/error/failure.dart';

abstract class TasksRepositoryLocal {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, bool>> deleteTask(Task params);
  Future<Either<Failure, bool>> saveTaskById(Task params);
}
