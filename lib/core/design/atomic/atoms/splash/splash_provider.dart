import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/config/routes/routes.dart';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> loadAppResources(BuildContext context) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _isLoading = false;
    if (context.mounted) {
      context.go(Routes.tasks);
    }
    notifyListeners();
  }
}
