import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/providers/login_provider.dart';
import 'package:notify/views/screens/login.dart';
import 'package:provider/provider.dart';

final GoRoute loginRoute = GoRoute(
  path: '/login',
  builder: (BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => LoginProvider(),
        child: const Login());
  },
);
