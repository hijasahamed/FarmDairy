import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen_appbar/retailer_home_screen_appbar.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen_bottom_app/retailer_home_screen_bottom_app.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/retialer_home_screen_body_widget.dart';
import 'package:flutter/material.dart';

class RetailerHomeScreen extends StatelessWidget {
  const RetailerHomeScreen({super.key,required this.screenSize,required this.email,required this.userData});
  final Size screenSize;
  final dynamic email;
  final dynamic userData;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: RetailerHomeScreenAppbar(screenSize: screenSize, isDarkMode: isDarkMode),
      body: RetailerHomeScreenBodyWidget(email: email, isDarkMode: isDarkMode, screenSize: screenSize), 
      bottomNavigationBar: RetailersHomeScreenBottomApp(screenSize: screenSize, isDarkMode: isDarkMode,userData: userData,),    
    );
  }
}

