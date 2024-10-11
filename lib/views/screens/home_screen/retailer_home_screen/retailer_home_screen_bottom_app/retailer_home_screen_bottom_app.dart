import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen_bottom_app/bottom_app_text_button_widget/bottom_app_text_button_widget.dart';
import 'package:flutter/material.dart';

class RetailersHomeScreenBottomApp extends StatelessWidget {
  const RetailersHomeScreenBottomApp({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.userData
  });

  final Size screenSize;
  final bool isDarkMode;
  final dynamic userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/75),
      child: BottomAppBar(
        color: isDarkMode?Colors.black:Colors.white,
        child: BottomAppTextButtonWidget(isDarkMode: isDarkMode,screenSize: screenSize,userData: userData,),
      ),
    );
  }
}

