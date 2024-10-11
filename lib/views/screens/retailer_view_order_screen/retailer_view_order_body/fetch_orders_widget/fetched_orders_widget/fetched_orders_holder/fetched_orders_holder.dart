import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/order_amount/order_amount.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/order_count/order_count.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/order_date/order_date.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/order_title/order_title.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/order_update/order_update.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/remove_order_button/remove_order_button.dart';
import 'package:flutter/material.dart';

class FetchedOrdersHolder extends StatelessWidget {
  const FetchedOrdersHolder({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.title,
    required this.orderDate,
    required this.itemCount,
    required this.totalAmount,
    required this.update,
    required this.documentId
  });

  final bool isDarkMode;
  final Size screenSize;
  final String title;
  final DateTime orderDate;
  final int itemCount;
  final int totalAmount;
  final String update;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDarkMode
          ? Colors.grey[900]
          : const Color.fromARGB(255, 241, 241, 241),
      margin: EdgeInsets.all(screenSize.width / 75),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width / 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderTitle(title: title, isDarkMode: isDarkMode, screenSize: screenSize),
                OrderDate(orderDate: orderDate, isDarkMode: isDarkMode, screenSize: screenSize),
                OrderCount(itemCount: itemCount, isDarkMode: isDarkMode, screenSize: screenSize),
                OrderAmount(totalAmount: totalAmount, isDarkMode: isDarkMode, screenSize: screenSize),
                OrderUpdate(update: update, isDarkMode: isDarkMode, screenSize: screenSize),
              ],
            ),
            const Spacer(),
            RemoveOrderButton(screenSize: screenSize, isDarkMode: isDarkMode,documentId: documentId,)
          ],
        ),
      ),
    );
  }
}

