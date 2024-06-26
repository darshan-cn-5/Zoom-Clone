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
        return windows;
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
    apiKey: 'AIzaSyCTLqwPltLrJbdyPBL3avsyAkerJoBGRGM',
    appId: '1:747886027060:web:5e8e952197993b94f8c561',
    messagingSenderId: '747886027060',
    projectId: 'zoom-clone-4081a',
    authDomain: 'zoom-clone-4081a.firebaseapp.com',
    storageBucket: 'zoom-clone-4081a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJUwpihbiiTD79i0oqdDDkkcEH8uFQM3w',
    appId: '1:747886027060:android:dc28e8c2c029cb51f8c561',
    messagingSenderId: '747886027060',
    projectId: 'zoom-clone-4081a',
    storageBucket: 'zoom-clone-4081a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb-spbe3C343Ae0lWHtS5F-O3B5MlW24M',
    appId: '1:747886027060:ios:61a9fbdb952957b1f8c561',
    messagingSenderId: '747886027060',
    projectId: 'zoom-clone-4081a',
    storageBucket: 'zoom-clone-4081a.appspot.com',
    iosBundleId: 'com.example.zoom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb-spbe3C343Ae0lWHtS5F-O3B5MlW24M',
    appId: '1:747886027060:ios:61a9fbdb952957b1f8c561',
    messagingSenderId: '747886027060',
    projectId: 'zoom-clone-4081a',
    storageBucket: 'zoom-clone-4081a.appspot.com',
    iosBundleId: 'com.example.zoom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTLqwPltLrJbdyPBL3avsyAkerJoBGRGM',
    appId: '1:747886027060:web:2b9bfafcc098e29ff8c561',
    messagingSenderId: '747886027060',
    projectId: 'zoom-clone-4081a',
    authDomain: 'zoom-clone-4081a.firebaseapp.com',
    storageBucket: 'zoom-clone-4081a.appspot.com',
  );
}
