import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/app/presentation/screens/tasks/tasks.dart';
import 'package:task/core/config/routes/routes.dart';
import 'package:task/core/design/atomic/atoms/splash/splash_view.dart';

abstract class Pages {
  static final GoRouter appRouter = GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
      name: 'splash',
      path: Routes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      name: 'tasks',
      path: Routes.tasks,
      builder: (BuildContext context, GoRouterState state) {
        return const TasksScreen();
      },
    ),
  ]);
}
