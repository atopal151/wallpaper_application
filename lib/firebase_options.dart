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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqaTFUEWsJ1_Qq6Z40y4-MQ0NnPAd3sM4',
    appId: '1:1028720112330:web:0527ec7b824a5fcfc77a33',
    messagingSenderId: '1028720112330',
    projectId: 'wallpaperapplication-c0ae6',
    authDomain: 'wallpaperapplication-c0ae6.firebaseapp.com',
    storageBucket: 'wallpaperapplication-c0ae6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNrvIeOInpI9cLhPT3VA44R1sLuhr0yUg',
    appId: '1:1028720112330:android:2a034fdd64b5de48c77a33',
    messagingSenderId: '1028720112330',
    projectId: 'wallpaperapplication-c0ae6',
    storageBucket: 'wallpaperapplication-c0ae6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_Hd4-ozO_FeiteDXvCdX9aMcOJfsIebQ',
    appId: '1:1028720112330:ios:a90fb9d10f18c754c77a33',
    messagingSenderId: '1028720112330',
    projectId: 'wallpaperapplication-c0ae6',
    storageBucket: 'wallpaperapplication-c0ae6.appspot.com',
    iosClientId: '1028720112330-ef4m930qs2o02lqkknkte90lnem5ipki.apps.googleusercontent.com',
    iosBundleId: 'com.example.wallpaperApplication',
  );
}