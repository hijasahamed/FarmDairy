import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_item_card.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.orders,
    required this.isDarkMode,
    required this.screenSize,
  });

  final List<QueryDocumentSnapshot> orders;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final orderData = orders[index];

        final String email = orderData['email'];
        final int itemCount = orderData['itemCount'];
        final DateTime orderDate = (orderData['orderDate'] as Timestamp).toDate();
        final String title = orderData['title'];
        final int totalAmount = orderData['totalAmount'];
        final String update = orderData['update'];
        final String documentId = orderData.id;

        return OrderItemCard(
          email: email,
          itemCount: itemCount,
          orderDate: orderDate,
          title: title,
          totalAmount: totalAmount,
          update: update,
          documentId: documentId,
          isDarkMode: isDarkMode,
          screenSize: screenSize,
        );
      },
    );
  }
}