import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginRegisterBackground extends StatelessWidget {
  const LoginRegisterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).canvasColor,
        ),
        SvgPicture.asset(
          "lib/assets/images/login_register_background/top_circle.svg",
          fit: BoxFit.fill,
          width: MediaQuery.sizeOf(context).width,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primaryContainer,
            BlendMode.srcIn,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SvgPicture.asset(
            "lib/assets/images/login_register_background/bottom_circle.svg",
            fit: BoxFit.fill,
            width: MediaQuery.sizeOf(context).width * 0.75,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
