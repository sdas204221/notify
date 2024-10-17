import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/routes/home/channel/channel_details/channel_details_route.dart';
import 'package:notify/views/screens/channel.dart';

final GoRoute channelRoute = GoRoute(
  path: "channel",
  builder: (BuildContext context, GoRouterState state) {
    try {
      return Channel(channelId: state.uri.queryParameters["id"]!);
    } catch (e) {
      throw Exception("id not found");
    }
  },
  routes: <RouteBase>[
    channelDetailsRoute,
  ],
);
