import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/no_order_widget/no_order_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/order_loading_widget/order_loading_widget.dart';
import 'package:flutter/material.dart';

class FetchOrdersWidget extends StatelessWidget {
  const FetchOrdersWidget({
    super.key,
    required this.userData,
    required this.isDarkMode,
    required this.screenSize,
  });

  final dynamic userData;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('productOrders')
          .where('email', isEqualTo: userData.email)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const OrderLoadingWidget();
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return NoOrderWidget(isDarkMode: isDarkMode, screenSize: screenSize);
        }
        final List<QueryDocumentSnapshot> orderDocs = snapshot.data!.docs;
        orderDocs.sort((a, b) {
          final Timestamp aOrderDate = a['orderDate'];
          final Timestamp bOrderDate = b['orderDate'];
          return bOrderDate.compareTo(aOrderDate);
        });
        return FetchedOrderWidget(orderDocs: orderDocs, isDarkMode: isDarkMode, screenSize: screenSize);
      },
    );
  }
}