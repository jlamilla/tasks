import 'package:get_it/get_it.dart';
import 'package:task/core/config/di/dependencies/external_dependency.dart';
import 'package:task/core/config/di/dependencies/local/data_source_dependency.dart';
import 'package:task/core/config/di/dependencies/local/local_storage_dependency.dart';
import 'package:task/core/config/di/dependencies/local/repository_local_dependency.dart';
import 'package:task/core/config/di/dependencies/local/use_case_local_dependency.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    await ExternalDependency.init();
    await LocalStorageDependency.init();
    // Local
    DataSourceLocalDependency.init();
    RepositoryLocalDependency.init();
    UseCaseLocalDependency.init();
  }
}
