import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCpLTwvba70aKZXZqF7Zc8fzJbC9FjUxZk",
            authDomain: "hems-spa.firebaseapp.com",
            projectId: "hems-spa",
            storageBucket: "hems-spa.appspot.com",
            messagingSenderId: "582563642316",
            appId: "1:582563642316:web:f9a397f7e4316230ee3b69",
            measurementId: "G-WVVGMC9KS3"));
  } else {
    await Firebase.initializeApp();
  }
}
