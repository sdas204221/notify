import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notify/views/widgets/home/channel_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome User'),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ChannelTile(channelId: index.toString());
          }),
      floatingActionButton: IconButton(
          style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).cardColor),
          color: Colors.red,
          onPressed: () {
            if (kDebugMode) {
              print("Add new channel");
            }
          },
          icon: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
            size: 60,
          )),
    );
  }
}
