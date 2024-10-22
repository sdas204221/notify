import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/channel/notice.dart';
import 'package:notify/views/widgets/channel_dp.dart';

class Channel extends StatelessWidget {
  final String channelId;
  const Channel({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    List<String> noticeIds =
        ChannelController.getNoticeIdsByChannelId(channelId);
    ChannelController.getNoticeIdsByChannelId(channelId);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            context.go("/home/channel/channel_details?id=$channelId");
          },
          child: Row(
            children: [
              Hero(
                  tag: "${channelId}dp",
                  child: ChannelDp(
                    channelId: channelId,
                    size: 25,
                  )),
              const SizedBox(width: 15),
              Text(
                ChannelController.getNameById(channelId),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: noticeIds.length,
        itemBuilder: (context, index) {
          return Notice(
            channelId: channelId,
            noticeId: noticeIds[index],
          );
        },
      ),
    );
  }
}
