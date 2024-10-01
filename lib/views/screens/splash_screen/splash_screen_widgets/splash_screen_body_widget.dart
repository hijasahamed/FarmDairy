import 'package:farm_dairy/views/screens/splash_screen/splash_screen_widgets/farm_dairy_logo_widget/farm_dairy_logo_widget.dart';
import 'package:farm_dairy/views/screens/splash_screen/splash_screen_widgets/no_network_loader_widget/no_network_loader_widget.dart';
import 'package:flutter/material.dart';

class SplashScreenBodyWidget extends StatelessWidget {
  const SplashScreenBodyWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FarmDairyLogoWidget(isDarkMode: isDarkMode,screenSize: screenSize,),
            NoNetworkLoaderWidget(screenSize: screenSize,)
          ],
        ),
      ),
    );
  }
}




