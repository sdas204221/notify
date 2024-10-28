import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class Fcm {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static void commonFirebaseMessagingHandler(RemoteMessage message) {
    if (kDebugMode) {
      print('Message data: ${message.data}');
    }

    if (message.notification != null) {
      if (kDebugMode) {
        print('Message also contained a notification: ${message.notification}');
      }
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    //await Firebase.initializeApp();
    commonFirebaseMessagingHandler(message);
  }

  static Future<void> setupFcm() async {
    await Firebase.initializeApp();
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    String? token = await messaging.getToken();
    if (kDebugMode) {
      print(token);
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void firebaseMessagingForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
      }
      commonFirebaseMessagingHandler(message);
    });
  }
}
