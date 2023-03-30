// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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
    apiKey: 'AIzaSyDgDiT304ah0kSTi8N7mirMRkgutD9rLM4',
    appId: '1:43476281628:web:a010e58295f894cbc0b2d9',
    messagingSenderId: '43476281628',
    projectId: 'fir-chat-a3742',
    authDomain: 'fir-chat-a3742.firebaseapp.com',
    databaseURL: 'https://fir-chat-a3742-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-chat-a3742.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkerh2HUhV8tCPhoTUvMeAjVuxpkfpzK8',
    appId: '1:43476281628:android:5127447e3924d3fdc0b2d9',
    messagingSenderId: '43476281628',
    projectId: 'fir-chat-a3742',
    databaseURL: 'https://fir-chat-a3742-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-chat-a3742.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSN5fubPp-Ow-xE1gzielpFvJTi9ek2Lg',
    appId: '1:43476281628:ios:7ede75facb62a3b6c0b2d9',
    messagingSenderId: '43476281628',
    projectId: 'fir-chat-a3742',
    databaseURL: 'https://fir-chat-a3742-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-chat-a3742.appspot.com',
    iosClientId: '43476281628-ap2uuvlh7sojpcosu56ku9mc3mkuoeb0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSN5fubPp-Ow-xE1gzielpFvJTi9ek2Lg',
    appId: '1:43476281628:ios:7ede75facb62a3b6c0b2d9',
    messagingSenderId: '43476281628',
    projectId: 'fir-chat-a3742',
    databaseURL: 'https://fir-chat-a3742-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-chat-a3742.appspot.com',
    iosClientId: '43476281628-ap2uuvlh7sojpcosu56ku9mc3mkuoeb0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
