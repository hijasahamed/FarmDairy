import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_app_bar/retailer_view_order_app_bar.dart';
import 'package:flutter/material.dart';

class AdminViewAllOrdersScreen extends StatelessWidget {
  const AdminViewAllOrdersScreen({
    super.key,
    required this.isDarkMode,
    required this.screenSize
    });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RetailerViewOrderAppBar(isDarkMode: isDarkMode, screenSize: screenSize,title: 'Orders',),
    );
  }
}