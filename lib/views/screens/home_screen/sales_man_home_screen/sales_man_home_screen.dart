import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen_appbar/retailer_home_screen_appbar.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_man_home_screen_body.dart';
import 'package:flutter/material.dart';

class SalesManHomeScreen extends StatelessWidget {
  const SalesManHomeScreen({
    super.key,
    required this.salesmanData,
    required this.screenSize
  });
  final Size screenSize;
  final SalesmanData salesmanData;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: RetailerHomeScreenAppbar(screenSize: screenSize, isDarkMode: isDarkMode),
      body: SalesManHomeScreenBodyWidget(salesmanData: salesmanData, isDarkMode: isDarkMode, screenSize: screenSize),
    ); 
  }
}