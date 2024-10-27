import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/channel/mute_button.dart';
import 'package:notify/views/widgets/channel/notice.dart';
import 'package:notify/views/widgets/channel_dp.dart';

class Channel extends StatefulWidget {
  final String channelId;

  const Channel({super.key, required this.channelId});

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  late bool isMuted;
  late int lastNoticeId;
  @override
  void initState() {
    isMuted = false;
    lastNoticeId = ChannelController.getLastNoticeId(widget.channelId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  Hero(
                      tag: "${widget.channelId}dp",
                      child: ChannelDp(
                        channelId: widget.channelId,
                        size: 25,
                      )),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                context
                    .go("/home/channel/channel_details?id=${widget.channelId}");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ChannelController.getChannelName(widget.channelId),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "${ChannelController.getSubscriberCount(widget.channelId)} subscribers",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: lastNoticeId,
              itemBuilder: (context, index) {
                return Notice(
                  channelId: widget.channelId,
                  noticeId: "${lastNoticeId - index - 1}",
                );
              },
            ),
          ),
          MuteButton(
              onTap: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
              isMuted: isMuted)
        ],
      ),
    );
  }
}
