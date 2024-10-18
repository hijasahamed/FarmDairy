import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/available_products_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/welcome_text/welcome_text.dart';
import 'package:flutter/material.dart';

class RetailerHomeScreenBodyWidget extends StatelessWidget {
  const RetailerHomeScreenBodyWidget({
    super.key,
    required this.email,
    required this.isDarkMode,
    required this.screenSize,
    required this.userData
  });

  final String email;
  final bool isDarkMode;
  final Size screenSize;
  final dynamic userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(isDarkMode: isDarkMode, screenSize: screenSize, email: email),
          AvailableProductsWidget(isDarkMode: isDarkMode, screenSize: screenSize,email: email,userData: userData,),          
        ],
      ),
    );
  }
}