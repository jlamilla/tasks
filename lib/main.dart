import 'package:flutter/material.dart';
import 'package:task/app/app.dart';
import 'package:task/core/config/di/di.dart';

Future<void> main() async {
  await DependencyInjection.init();
  runApp(const App());
}
