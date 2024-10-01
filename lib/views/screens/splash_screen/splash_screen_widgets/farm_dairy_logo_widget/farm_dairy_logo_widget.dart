import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FarmDairyLogoWidget extends StatelessWidget {
  const FarmDairyLogoWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          isDarkMode
            ? 'assets/images/Logo_dark_theme.svg'
            : 'assets/images/Logo_light_theme.svg'
        ),
        SizedBox(height: screenSize.height/50,)
      ],
    );
  }
}