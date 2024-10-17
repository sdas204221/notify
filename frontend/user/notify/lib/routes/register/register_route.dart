import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/views/screens/register.dart';

final GoRoute registerRoute = GoRoute(
  path: 'register',
  builder: (BuildContext context, GoRouterState state) {
    return const Register();
  },
);
