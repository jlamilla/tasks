import 'package:hive_flutter/adapters.dart';

class LocalStorageDependency {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  ///Se registran todos los adapters creados en hive
  static void _registerAdapters() {
    _actionPlan();
  }

  static void _actionPlan() {
    //Hive.registerAdapter(ActionPlanResponseLocalAdapter());
  }
}
