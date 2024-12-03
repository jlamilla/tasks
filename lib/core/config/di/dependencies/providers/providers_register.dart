import 'package:flutter/widgets.dart';
import 'package:task/app/presentation/screens/tasks/tasks_provider.dart';
import 'package:task/core/config/di/dependencies/providers/provider_imports.dart';


class ProviderLit{
  List<SingleChildWidget> get listProvider => <SingleChildWidget>[
    ..._providersSplash,
    ..._providersUseCase,
  ];

  final List<SingleChildWidget> _providersSplash = <SingleChildWidget>[
    ChangeNotifierProvider<SplashProvider>(create: (BuildContext context) => SplashProvider(), lazy: false, ),
  ];

  final List<SingleChildWidget> _providersUseCase = <SingleChildWidget>[
    ChangeNotifierProvider<TasksProvider>(
      create: (BuildContext context) => TasksProvider(
        getTasksUseCase: sl(),
        saveTaskByIdUseCase: sl(),
        deleteTaskByIdUseCase: sl(),
      ), 
      lazy: false,
    ),
  ];
}
