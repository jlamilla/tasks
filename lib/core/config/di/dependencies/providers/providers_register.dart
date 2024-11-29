import 'package:task/app/presentation/screens/tasks/tasks_provider.dart';
import 'package:task/core/config/di/dependencies/providers/provider_imports.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._providersSplash,
  ..._providersUseCase,
];

List<SingleChildWidget> _providersSplash = <SingleChildWidget>[
  ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider(), lazy: false, ),
];

List<SingleChildWidget> _providersUseCase = <SingleChildWidget>[
  ChangeNotifierProvider<TasksProvider>(
    create: (_) => TasksProvider(
      getTasksUseCase: sl(),
      saveTaskByIdUseCase: sl(),
      deleteTaskByIdUseCase: sl(),
    ), 
    lazy: false,
  ),
];
