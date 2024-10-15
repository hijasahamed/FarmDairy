import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/orders_details_holder_widget/orders_details_holder_widget.dart';
import 'package:flutter/material.dart';

Widget adminAllOrdersCardWidget(
    List<QueryDocumentSnapshot> orders, bool isDarkMode, Size screenSize) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: orders.length,
    itemBuilder: (context, index) {
      var order = orders[index];
      var documentId = order.id;
      var company = order['email'];
      var companyPrefix = company.split('@')[0].toUpperCase();
      return Card(
        color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: OrdersDetailsHolderWidget(order: order, companyPrefix: companyPrefix, documentId: documentId,isDarkMode: isDarkMode,screenSize: screenSize,),
      );
    },
  );
}