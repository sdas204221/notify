import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/channel_dp.dart';

class ChannelTile extends StatelessWidget {
  final String channelId;
  const ChannelTile({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    String channelName = ChannelController.getChannelName(channelId);
    String recentNotice =
        ChannelController.getRecentNoticeByChannelId(channelId);
    recentNotice =
        "${recentNotice.substring(0, min(20, recentNotice.length)).replaceAll(RegExp('\n'), " ")}...";
    String recentNoticeTime =
        ChannelController.getRecentNoticeTimeByChannelId(channelId);
    return GestureDetector(
      onTap: () {
        context.go("/home/channel?id=$channelId");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: ChannelDp(
                    channelId: channelId,
                    size: 40,
                    radius: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 2, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        channelName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        recentNotice,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              recentNoticeTime,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
