import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/services/fcm/fcm.dart';
import 'package:notify/setup_locator.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupLocator();

  if (Platform.isAndroid) {
    Fcm.setupFcm();
  }
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

    if (Platform.isAndroid) {
      Fcm.firebaseMessagingForegroundHandler();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          labelMedium:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          titleLarge:
              TextStyle(fontSize: 65, color: Theme.of(context).cardColor),
          titleMedium: const TextStyle(fontSize: 30),
          titleSmall: const TextStyle(fontSize: 20),
          labelSmall: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 17, color: Colors.black26),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).primaryColor),
              foregroundColor:
                  WidgetStatePropertyAll(Theme.of(context).cardColor),
              minimumSize: WidgetStatePropertyAll(
                  Size(MediaQuery.sizeOf(context).width - 70, 50)),
              textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 20))),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            elevation: WidgetStatePropertyAll(0),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontSize: 15, decoration: TextDecoration.underline)),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
