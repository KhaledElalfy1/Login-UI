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
    apiKey: 'AIzaSyBBLESzO5xKYj1_wix5cpmuHx6pOCVXWtY',
    appId: '1:382630740426:web:d07791412b206434858f33',
    messagingSenderId: '382630740426',
    projectId: 'test-firebase-20fe7',
    authDomain: 'test-firebase-20fe7.firebaseapp.com',
    storageBucket: 'test-firebase-20fe7.appspot.com',
    measurementId: 'G-CFS73R2WRZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOd1HlzFJxYWkAj6PYotvriQD-N07f9bQ',
    appId: '1:382630740426:android:c037bca092a24784858f33',
    messagingSenderId: '382630740426',
    projectId: 'test-firebase-20fe7',
    storageBucket: 'test-firebase-20fe7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDzVLavxMXCQSGqXGtIA5abUYiYljMtRo',
    appId: '1:382630740426:ios:9bc54c934fa6f484858f33',
    messagingSenderId: '382630740426',
    projectId: 'test-firebase-20fe7',
    storageBucket: 'test-firebase-20fe7.appspot.com',
    iosClientId: '382630740426-1cnhoq03v1b73iot2h23of4u4b5bso9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.responsiveUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDzVLavxMXCQSGqXGtIA5abUYiYljMtRo',
    appId: '1:382630740426:ios:9bc54c934fa6f484858f33',
    messagingSenderId: '382630740426',
    projectId: 'test-firebase-20fe7',
    storageBucket: 'test-firebase-20fe7.appspot.com',
    iosClientId: '382630740426-1cnhoq03v1b73iot2h23of4u4b5bso9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.responsiveUi',
  );
}
