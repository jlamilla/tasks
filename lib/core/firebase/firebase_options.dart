// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByV8k3L4VDHBFjRs4h9lgv0E8yzHXE9Y4',
    appId: '1:303599992035:android:c6f03d1e72554f3f9dd9d6',
    messagingSenderId: '303599992035',
    projectId: 'altipal-meca-dev',
    storageBucket: 'altipal-meca-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrC3-MO4X_DESTpsDlEcHhNlbFq3H5SC8',
    appId: '1:303599992035:ios:2ec49410a0625e329dd9d6',
    messagingSenderId: '303599992035',
    projectId: 'altipal-meca-dev',
    storageBucket: 'altipal-meca-dev.appspot.com',
    androidClientId: '303599992035-28q76lo6ig7oh1ii3gp935ucisj6653p.apps.googleusercontent.com',
    iosClientId: '303599992035-f3bd3gqmg54uof74j3e3lbfv7ghpr4ka.apps.googleusercontent.com',
    iosBundleId: 'co.com.altipal.meca.dev',
  );
}
