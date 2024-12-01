import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:task/core/firebase/firebase_options.dart';

class ExternalDependency {
  ExternalDependency._();
  static Future<void> init() async {

    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'tasks_app',
    );
    
    await initializeDateFormatting();
  }
}
