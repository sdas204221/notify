import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notify/views/widgets/channel_dp.dart';
import 'package:notify/views/widgets/home/channel_tile.dart';
import 'package:notify/views/widgets/home/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 50;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'NotifyALL',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        bottom:
            PreferredSize(preferredSize: const Size(0, 8), child: Container()),
      ),
      drawer: const HomeDrawer(),
      body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ChannelTile(
                  channelId: index.toString(),
                ),
                Visibility(
                  visible: index != itemCount - 1,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    child: Divider(),
                  ),
                ),
              ],
            );
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
