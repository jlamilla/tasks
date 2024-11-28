import 'package:task/core/config/di/di.dart';

class UseCaseLocalDependency {
  static void init() {
    initLocalDataUseCase();
  }

  static void initLocalDataUseCase() {

    // sl.registerLazySingleton(
    //   () => GetBooksNewUseCase(
    //     booksRepository: sl(),
    //   ),
    // );
  }
}
