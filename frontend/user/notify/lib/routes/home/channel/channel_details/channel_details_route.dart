import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/views/screens/channel_details.dart';

final GoRoute channelDetailsRoute = GoRoute(
  path: 'channel_details',
  builder: (BuildContext context, GoRouterState state) {
    try {
      return ChannelDetails(channelId: state.uri.queryParameters["id"]!);
    } catch (e) {
      throw Exception("id not found");
    }
  },
);
