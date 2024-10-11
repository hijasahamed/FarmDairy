import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetch_orders_widget.dart';
import 'package:flutter/material.dart';

class RetailerViewOrderBody extends StatelessWidget {
  const RetailerViewOrderBody({
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
    return FetchOrdersWidget(userData: userData, isDarkMode: isDarkMode, screenSize: screenSize);
  }
}

