import 'package:either_dart/either.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/repositories/task_data_repository_local.dart';
import 'package:task/app/domain/use_cases/use_case.dart';
import 'package:task/core/config/error/failure.dart';

class GetTasksUseCase extends UseCase<List<Task>, NoParams> {
  
  GetTasksUseCase({ required TasksRepositoryLocal repository}): _repository = repository;

  final TasksRepositoryLocal _repository;

  @override
  Future<Either<Failure, List<Task>>> call( NoParams params) {
    return _repository.getTasks();
  }
}
