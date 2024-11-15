import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/controllers/channel_controller.dart';
import 'package:notify/views/widgets/home/channel_tile.dart';
import 'package:notify/views/widgets/home/home_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> channelIds;
  @override
  void initState() {
    channelIds = GetIt.instance<ChannelController>().getAllChannelIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          itemCount: channelIds.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ChannelTile(
                  channelId: channelIds[index],
                ),
                Visibility(
                  visible: index != channelIds.length - 1,
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
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
          onPressed: () {
            if (kDebugMode) {
              //TODO implement logic
              print("Add new channel");
            }
          },
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
            size: 60,
          )),
    );
  }
}
