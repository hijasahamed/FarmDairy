import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/admin_view_all_order_body_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_app_bar/retailer_view_order_app_bar.dart';
import 'package:flutter/material.dart';
class AdminViewAllOrdersScreen extends StatelessWidget {
  const AdminViewAllOrdersScreen({
    super.key,
    required this.screenSize
    });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: RetailerViewOrderAppBar(isDarkMode: isDarkMode, screenSize: screenSize,title: 'Orders',),
      body: AdminViewAllOrdersScreenBody(screenSize: screenSize, isDarkMode: isDarkMode),
    );
  }
}