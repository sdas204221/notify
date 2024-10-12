import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/controllers/channel_controller.dart';

class ChannelTile extends StatelessWidget {
  final String channelId;
  const ChannelTile({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    String channelName = ChannelController.getNameById(channelId);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)))),
        onPressed: () {
          if (kDebugMode) {
            print("trying $channelId");
          }
          context.go("/home/channel?id=$channelId");
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Text(
                    channelName[0],
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  channelName,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
