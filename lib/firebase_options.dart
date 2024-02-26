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
    apiKey: 'AIzaSyAj8dZFZy7fBPc_h4L0flfNufUkhWel52o',
    appId: '1:540737439716:web:858b92e2e5af6848b969f1',
    messagingSenderId: '540737439716',
    projectId: 'meyo-impact',
    authDomain: 'meyo-impact.firebaseapp.com',
    storageBucket: 'meyo-impact.appspot.com',
    measurementId: 'G-410Y1WH1VK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVihDt2li8KLBPnBCjTO_CAGOanQAoCmk',
    appId: '1:540737439716:android:226d7e18b0934587b969f1',
    messagingSenderId: '540737439716',
    projectId: 'meyo-impact',
    storageBucket: 'meyo-impact.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfP_nRojdA-sb2Qmvdkrl2wHaZskpyic4',
    appId: '1:540737439716:ios:c316484e5e65d2b7b969f1',
    messagingSenderId: '540737439716',
    projectId: 'meyo-impact',
    storageBucket: 'meyo-impact.appspot.com',
    androidClientId: '540737439716-j468vskjf472rfapeaqc801lma4jcoem.apps.googleusercontent.com',
    iosClientId: '540737439716-r73c7lji6n6fli451bs2lh83bmqnhmto.apps.googleusercontent.com',
    iosBundleId: 'com.example.meyoImpact',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfP_nRojdA-sb2Qmvdkrl2wHaZskpyic4',
    appId: '1:540737439716:ios:02c081136650f002b969f1',
    messagingSenderId: '540737439716',
    projectId: 'meyo-impact',
    storageBucket: 'meyo-impact.appspot.com',
    androidClientId: '540737439716-j468vskjf472rfapeaqc801lma4jcoem.apps.googleusercontent.com',
    iosClientId: '540737439716-j0go1ppj0t3fdmj0jbijeivaesdom1k3.apps.googleusercontent.com',
    iosBundleId: 'com.example.meyoImpact.RunnerTests',
  );
}