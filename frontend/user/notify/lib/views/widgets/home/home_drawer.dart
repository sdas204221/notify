import 'package:flutter/material.dart';
import 'package:notify/views/widgets/channel_dp.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 135,
                  ),
                  const ChannelDp(channelId: "User", size: 125),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 150),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 65),
                    child: Text(
                      "Logout",
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
