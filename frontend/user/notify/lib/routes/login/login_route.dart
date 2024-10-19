import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/views/screens/login.dart';

final GoRoute loginRoute = GoRoute(
  path: '/login',
  builder: (BuildContext context, GoRouterState state) {
    return const Login();
  },
);
