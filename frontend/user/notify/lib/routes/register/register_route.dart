import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/providers/register_provider.dart';
import 'package:notify/views/screens/register.dart';
import 'package:provider/provider.dart';

final GoRoute registerRoute = GoRoute(
  path: '/register',
  builder: (BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => RegesterProvider(),
        child: const Register());
  },
);
