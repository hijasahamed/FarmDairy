import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSignUpScreenLogo extends StatelessWidget {
  const LoginSignUpScreenLogo({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenSize.height / 8,
          width: screenSize.width,
          child: SvgPicture.asset(isDarkMode
              ? 'assets/images/Logo_dark_theme.svg'
              : 'assets/images/Logo_light_theme.svg'),
        ),
        SizedBox(height: screenSize.height / 20),
      ],
    );
  }
}