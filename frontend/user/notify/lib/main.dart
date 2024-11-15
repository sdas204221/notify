import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/services/fcm/fcm.dart';
import 'package:notify/setup_locator.dart';
import 'package:notify/theme/theme_1/dark_theme_1.dart';
import 'package:notify/theme/theme_1/light_theme_1.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupLocator();

  // if (Platform.isAndroid) {
  //   Fcm.setupFcm();
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 0), () {
      FlutterNativeSplash.remove();
    });

    // if (Platform.isAndroid) {
    //   Fcm.firebaseMessagingForegroundHandler();
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme1(context),
      darkTheme: darkTheme1(context),
      routerConfig: router,
    );
  }
}
