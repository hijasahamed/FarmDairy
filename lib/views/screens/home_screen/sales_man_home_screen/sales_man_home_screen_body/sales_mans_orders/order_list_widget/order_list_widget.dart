import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

        // Extract location data (latitude and longitude)
        final Map<String, dynamic> location = orderData['location'];
        final double latitude = location['latitude'];
        final double longitude = location['longitude'];

        // Create LatLng object using Firebase data
        final LatLng destination = LatLng(latitude, longitude);

        final String shopName = email.split('@')[0];

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
          destination: destination,
          shopName: shopName,
        );
      },
    );
  }
}