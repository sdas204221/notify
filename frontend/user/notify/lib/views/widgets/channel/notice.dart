import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Notice extends StatelessWidget {
  final String messageId;
  final String channelId;
  const Notice({super.key, required this.messageId, required this.channelId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).focusColor,
        height: 50,
        child: Text("${messageId}th messege of $channelId group"),
      ),
    );
  }
}
