import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/fetched_orders_holder.dart';
import 'package:flutter/material.dart';

class FetchedOrderWidget extends StatelessWidget {
  const FetchedOrderWidget({
    super.key,
    required this.orderDocs,
    required this.isDarkMode,
    required this.screenSize,
  });

  final List<QueryDocumentSnapshot<Object?>> orderDocs;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderDocs.length,
      itemBuilder: (context, index) {
        final orderData = orderDocs[index];        
        // Extract data from the document
        final String title = orderData['title'];
        final DateTime orderDate = (orderData['orderDate'] as Timestamp).toDate();
        final int totalAmount = orderData['totalAmount'];
        final int itemCount = orderData['itemCount'];
        final String update = orderData['update'];
        
        return FetchedOrdersHolder(isDarkMode: isDarkMode, screenSize: screenSize, title: title, orderDate: orderDate, itemCount: itemCount, totalAmount: totalAmount, update: update);
      },
    );
  }
}

