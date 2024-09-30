import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenBodyWidget extends StatelessWidget {
  const SplashScreenBodyWidget({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SvgPicture.asset(isDarkMode?'assets/images/Logo_dark_theme.svg':'assets/images/Logo_light_theme.svg'),
      ),
    );
  }
}