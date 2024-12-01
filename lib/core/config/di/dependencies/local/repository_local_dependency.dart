import 'package:task/app/data/repositories/task_data_repository_local_impl.dart';
import 'package:task/app/domain/repositories/task_data_repository_local.dart';
import 'package:task/core/config/di/di.dart';

class RepositoryLocalDependency {

  static void init() {
    initLocalRepository();
  }

  static void initLocalRepository() {
    sl.registerLazySingleton<TasksRepositoryLocal>(
      () => TaskRepositoryLocalImpl(taskLocalDataSource: sl()),
    );
  }
}
