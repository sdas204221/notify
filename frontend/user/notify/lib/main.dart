import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/views/screens/channel.dart';
import 'package:notify/views/screens/home.dart';
import 'package:notify/views/screens/login.dart';
import 'package:notify/views/screens/register.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          },
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
            routes: <RouteBase>[
              GoRoute(
                  path: "channel",
                  builder: (BuildContext context, GoRouterState state) {
                    try {
                      return Channel(
                          channelId: state.uri.queryParameters["id"]!);
                    } catch (e) {
                      throw Exception("id not found");
                    }
                  })
            ]),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const Register();
          },
        ),
      ],
    ),
  ],
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
