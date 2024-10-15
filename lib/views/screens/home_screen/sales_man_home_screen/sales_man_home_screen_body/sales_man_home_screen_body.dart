import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/sales_mans_orders.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/welcome_text_widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SalesManHomeScreenBodyWidget extends StatelessWidget {
  const SalesManHomeScreenBodyWidget({
    super.key,
    required this.salesmanData,
    required this.isDarkMode,
    required this.screenSize,
  });

  final SalesmanData salesmanData;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeTextWidget(salesmanData: salesmanData, isDarkMode: isDarkMode, screenSize: screenSize),
          SalesMansOrders(salesmanData: salesmanData, isDarkMode: isDarkMode, screenSize: screenSize),
        ],
      ),
    );
  }
}