import 'package:task/app/data/data_source/tasks_data_source_local_impl.dart';
import 'package:task/app/domain/data_source/tasks_data_source_local.dart';
import 'package:task/core/config/di/di.dart';
import 'package:task/core/services/center_local_storage.dart';

class DataSourceLocalDependency {
  static void init() {
    final CenterLocalStorage localStorage = CenterLocalStorage();
    
    sl.registerLazySingleton<TasksLocalDataSource>(
      () => TasksDataSourceLocalImpl(local: localStorage),
    );
  }
}
