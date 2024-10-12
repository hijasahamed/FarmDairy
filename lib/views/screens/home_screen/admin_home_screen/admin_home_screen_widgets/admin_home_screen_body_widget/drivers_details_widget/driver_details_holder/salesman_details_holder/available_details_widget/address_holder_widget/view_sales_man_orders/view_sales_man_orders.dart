import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/view_sales_man_orders/orders_app_bar/orders_app_bar.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/view_sales_man_orders/view_sales_man_orders_body/view_sales_man_orders_body.dart';
import 'package:flutter/material.dart';

class ViewSalesManOrders extends StatelessWidget {
  const ViewSalesManOrders({
    super.key,
    required this.screenSize,
    required this.salesManLocation,
    required this.salesmanName,
  });

  final Size screenSize;
  final String salesManLocation;
  final String salesmanName;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: ViewSalesManOrdersAppBar(
        isDarkMode: isDarkMode,
        salesManLocation: salesManLocation,
        screenSize: screenSize,
        salesManName: salesmanName,
      ),
      body: ViewSalesManOrdersBody(screenSize: screenSize, salesManLocation: salesManLocation, salesmanName: salesmanName, isDarkMode: isDarkMode)
    );
  }
}