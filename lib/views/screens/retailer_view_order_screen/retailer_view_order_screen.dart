import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_app_bar/retailer_view_order_app_bar.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/retailer_view_order_body.dart';
import 'package:flutter/material.dart';

class RetailerViewOrderScreen extends StatelessWidget {
  const RetailerViewOrderScreen({super.key,required this.screenSize,required this.userData});
  final Size screenSize;
  final dynamic userData;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: RetailerViewOrderAppBar(isDarkMode: isDarkMode, screenSize: screenSize),
      body: RetailerViewOrderBody(screenSize: screenSize,isDarkMode: isDarkMode,userData: userData,),
    );
  }
}

