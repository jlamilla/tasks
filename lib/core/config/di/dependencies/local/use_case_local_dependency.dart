import 'package:task/app/domain/use_cases/task/delete_task_by_id_use_case.dart';
import 'package:task/app/domain/use_cases/task/get_tasks_use_case.dart';
import 'package:task/app/domain/use_cases/task/save_task_by_id_use_case.dart';
import 'package:task/core/config/di/di.dart';

class UseCaseLocalDependency {
  static void init() {
    initLocalDataUseCase();
  }

  static void initLocalDataUseCase() {

    sl.registerLazySingleton(
      () => DeleteTaskByIdUseCase(
        repository: sl(),
      ),
    );
    sl.registerLazySingleton(
      () => SaveTaskByIdUseCase(
        repository: sl(),
      ),
    );
    sl.registerLazySingleton(
      () => GetTasksUseCase(
        repository: sl(),
      ),
    );
  }
}
