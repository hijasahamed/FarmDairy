import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_date_text/order_date_text.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_email_text/order_email_text.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_name_text/order_name_text.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_pcs_count/order_pcs_count.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_status_widget/order_status_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_title_text/order_title_text.dart';
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.email,
    required this.itemCount,
    required this.orderDate,
    required this.title,
    required this.totalAmount,
    required this.update,
    required this.documentId,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String email;
  final int itemCount;
  final DateTime orderDate;
  final String title;
  final int totalAmount;
  final String update;
  final String documentId;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      margin: EdgeInsets.all(screenSize.width / 40),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderTitleText(title: title, isDarkMode: isDarkMode, screenSize: screenSize),
            OrderNameText(email: email, isDarkMode: isDarkMode, screenSize: screenSize),
            OrderPcsCount(itemCount: itemCount, isDarkMode: isDarkMode, screenSize: screenSize),
            OrderEmailText(email: email, isDarkMode: isDarkMode, screenSize: screenSize),
            OrderDateText(orderDate: orderDate, isDarkMode: isDarkMode, screenSize: screenSize),
            OrderStatusWidget(update: update, screenSize: screenSize, isDarkMode: isDarkMode),
          ],
        ),
      ),
    );
  }
}