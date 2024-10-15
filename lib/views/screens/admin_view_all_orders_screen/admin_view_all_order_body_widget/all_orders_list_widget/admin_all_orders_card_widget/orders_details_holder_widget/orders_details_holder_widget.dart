import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/orders_details_holder_widget/order_details_widget/order_details_widget.dart';
import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/orders_details_holder_widget/order_update_and_date/order_update_and_date.dart';
import 'package:flutter/material.dart';

class OrdersDetailsHolderWidget extends StatelessWidget {
  const OrdersDetailsHolderWidget({
    super.key,
    required this.order,
    required this.companyPrefix,
    required this.documentId,
    required this.isDarkMode,
    required this.screenSize
  });

  final QueryDocumentSnapshot<Object?> order;
  final dynamic companyPrefix;
  final String documentId;
  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          OrderDetailsWidget(order: order, screenSize: screenSize, isDarkMode: isDarkMode, companyPrefix: companyPrefix),
          OrderUpdateAndDate(order: order, screenSize: screenSize, isDarkMode: isDarkMode),
        ],
      ),
    );
  }
}