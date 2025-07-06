import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyDZOtHy2QZt-31dyn1fhmEdLKm0w5PAd_c',
      appId: '1:508347650189:android:c2cbf28352ff651ae592c4',
      messagingSenderId: '508347650189',
      projectId: 'rewearth-2931e',
      storageBucket: 'rewearth-2931e.firebasestorage.app',
      databaseURL: 'https://rewearth-2931e-default-rtdb.asia-southeast1.firebasedatabase.app',
    );
  }
}
