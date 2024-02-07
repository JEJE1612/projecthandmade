
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    
    appId: '1:938214522724:android:27492a519ecd779da60471',
    messagingSenderId: '938214522724',
    projectId: 'handmade-73f02',
    storageBucket: 'handmade-73f02.appspot.com', 
    apiKey: 'AIzaSyCF2Hv234cc9bRY6Fh27380OUQOJ9wg6LM',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCF2Hv234cc9bRY6Fh27380OUQOJ9wg6LM",
    appId: '1:938214522724:ios:bf135a64ac15fdb0a60471',
    messagingSenderId: '938214522724',
    projectId: 'handmade-73f02',
    storageBucket: 'handmade-73f02.appspot.com',
    iosBundleId: 'com.example.handmade',
    appGroupId:"app-1-938214522724-ios-bf135a64ac15fdb0a60471"
  );
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCF2Hv234cc9bRY6Fh27380OUQOJ9wg6LM",
    appId: '1:938214522724:web:a38747b4337ed452a60471',
    messagingSenderId: '938214522724',
    projectId: 'handmade-73f02',
    storageBucket: 'handmade-73f02.appspot.com',
    authDomain: "handmade-73f02.firebaseapp.com",
    measurementId: "G-67GE7YQMF0"
  );
}
