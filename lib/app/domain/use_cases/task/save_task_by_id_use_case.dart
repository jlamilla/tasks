import 'package:either_dart/either.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/repositories/task_data_repository_local.dart';
import 'package:task/app/domain/use_cases/use_case.dart';
import 'package:task/core/config/error/failure.dart';

class SaveTaskByIdUseCase extends UseCase<bool, Task> {
  
  SaveTaskByIdUseCase({ required TasksRepositoryLocal repository}): _repository = repository;

  final TasksRepositoryLocal _repository;

  @override
  Future<Either<Failure, bool>> call(Task params) {
    return _repository.saveTaskById(params);
  }
}
