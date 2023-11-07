// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAA0u-e7j3Os-x6Nb5_DF8xSJAz0QToVwk',
    appId: '1:609235604463:web:33397b3fe1264b565edc1a',
    messagingSenderId: '609235604463',
    projectId: 'h-store-aa1b8',
    authDomain: 'h-store-aa1b8.firebaseapp.com',
    storageBucket: 'h-store-aa1b8.appspot.com',
    measurementId: 'G-Y05WN6LDWZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvVsOGV4qJHZYpnAJS1yXdTA84jCL_mOw',
    appId: '1:609235604463:android:67fb36202ae1359d5edc1a',
    messagingSenderId: '609235604463',
    projectId: 'h-store-aa1b8',
    storageBucket: 'h-store-aa1b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6pS47vGelXUkILfuQCMXZQufyLtVtIQk',
    appId: '1:609235604463:ios:1fdecdd16c70dbb75edc1a',
    messagingSenderId: '609235604463',
    projectId: 'h-store-aa1b8',
    storageBucket: 'h-store-aa1b8.appspot.com',
    iosBundleId: 'com.example.hStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6pS47vGelXUkILfuQCMXZQufyLtVtIQk',
    appId: '1:609235604463:ios:b1b1d01d932f7a075edc1a',
    messagingSenderId: '609235604463',
    projectId: 'h-store-aa1b8',
    storageBucket: 'h-store-aa1b8.appspot.com',
    iosBundleId: 'com.example.hStore.RunnerTests',
  );
}
