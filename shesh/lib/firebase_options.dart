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
    apiKey: 'AIzaSyBnTRscDXY-O1Q412pra6Hi2bBExmP_g9c',
    appId: '1:823275179908:web:22d293c3a3cd23469cd7d1',
    messagingSenderId: '823275179908',
    projectId: 'kaidefirebase',
    authDomain: 'kaidefirebase.firebaseapp.com',
    storageBucket: 'kaidefirebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsMF2CcavRMINzo475qU1NL8_ZKs2eCao',
    appId: '1:823275179908:android:2e270931e0b5d01b9cd7d1',
    messagingSenderId: '823275179908',
    projectId: 'kaidefirebase',
    storageBucket: 'kaidefirebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtrTC62zQhBTlChVaI8w3SGa9Wm7HgLXU',
    appId: '1:823275179908:ios:ecc2ba4835aaf1659cd7d1',
    messagingSenderId: '823275179908',
    projectId: 'kaidefirebase',
    storageBucket: 'kaidefirebase.appspot.com',
    iosBundleId: 'com.example.shesh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtrTC62zQhBTlChVaI8w3SGa9Wm7HgLXU',
    appId: '1:823275179908:ios:553e3efe02528c5b9cd7d1',
    messagingSenderId: '823275179908',
    projectId: 'kaidefirebase',
    storageBucket: 'kaidefirebase.appspot.com',
    iosBundleId: 'com.example.shesh.RunnerTests',
  );
}