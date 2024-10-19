import 'package:flutter/material.dart';
import 'package:notify/controllers/channel_controller.dart';

class ChannelDp extends StatelessWidget {
  final String channelId;
  final double size;
  final double? radius;
  const ChannelDp(
      {super.key, required this.channelId, required this.size, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? size,
      child: Text(
        ChannelController.getNameById(channelId)[0],
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
