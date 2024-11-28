import 'package:task/core/config/di/di.dart';
import 'package:task/core/services/center_local_storage.dart';

class DataSourceLocalDependency {
  static void init() {
    final CenterLocalStorage localStorage = CenterLocalStorage();
    
    // sl.registerLazySingleton<BooksDataSource>(
    //   () => BooksDataSourceImpl(),
    // );
  }
}
