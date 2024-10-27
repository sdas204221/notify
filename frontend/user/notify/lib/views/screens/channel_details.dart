import 'package:flutter/material.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/channel_dp.dart';

class ChannelDetails extends StatelessWidget {
  final String channelId;
  const ChannelDetails({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Hero(
              tag: "${channelId}dp",
              child: Center(child: ChannelDp(channelId: channelId, size: 130)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 30),
                child: Text(
                  ChannelController.getChannelName(channelId),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const Text(
              "Description",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            Text(ChannelController.getChannelDescription(channelId)),
          ],
        ),
      ),
    );
  }
}
