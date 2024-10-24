import 'package:flutter/material.dart';

class MuteButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isMuted;
  const MuteButton({super.key, required this.onTap, required this.isMuted});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
            child: Text(
          isMuted ? "Unmute" : "Mute",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).canvasColor),
        )),
      ),
    );
  }
}
