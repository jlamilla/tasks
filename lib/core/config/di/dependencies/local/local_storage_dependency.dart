import 'package:hive_flutter/adapters.dart';
import 'package:task/app/data/models/task/task.dart';

class LocalStorageDependency {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  static void _registerAdapters() {
    _task();
  }

  static void _task() {
    Hive.registerAdapter(TaskAdapter());
  }
}
