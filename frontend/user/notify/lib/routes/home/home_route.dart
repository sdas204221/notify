import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/routes/home/channel/channel_route.dart';
import 'package:notify/views/screens/home.dart';

final GoRoute homeRoute = GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const Home();
    },
    routes: <RouteBase>[
      channelRoute,
    ]);
