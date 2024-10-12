import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/channel/notice.dart';

class Channel extends StatelessWidget {
  final String channelId;
  const Channel({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    List<String> messageIds =
        ChannelController.getMessageIdsByChannelId(channelId);
    ChannelController.getMessageIdsByChannelId(channelId);
    return Scaffold(
      appBar: AppBar(
        title: Text(ChannelController.getNameById(channelId)),
      ),
      body: ListView.builder(
        itemCount: messageIds.length,
        itemBuilder: (context, index) {
          return Notice(
            channelId: channelId,
            messageId: messageIds[index],
          );
        },
      ),
    );
  }
}
