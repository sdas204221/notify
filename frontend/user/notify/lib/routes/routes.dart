import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/providers/register_provider.dart';
import 'package:notify/routes/home/home_route.dart';
import 'package:notify/routes/login/login_route.dart';
import 'package:notify/routes/register/register_route.dart';
import 'package:notify/views/screens/register.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
            create: (BuildContext context) => RegesterProvider(),
            child: const Register());
      },
    ),
    loginRoute,
    homeRoute,
    registerRoute,
  ],
);
