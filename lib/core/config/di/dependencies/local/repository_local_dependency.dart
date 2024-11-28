import 'package:task/core/config/di/di.dart';

class RepositoryLocalDependency {

  static void init() {
    initLocalRepository();
  }

  static void initLocalRepository() {
    // sl.registerLazySingleton<BooksRepository>(
    //   () => BooksRepositoryImpl(booksDatasource: sl(),),
    // );
  }
}
