import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/view_sales_man_orders/view_sales_man_orders_body/orders_build_widget/orders_build_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_loading_widget/details_loading_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_not_found/details_not_found.dart';
import 'package:flutter/material.dart';

class AdminViewAllOrdersScreenBody extends StatelessWidget {
  const AdminViewAllOrdersScreenBody({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productOrders')
          .orderBy('orderDate', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<QueryDocumentSnapshot> orders = snapshot.data!.docs;
        if (!snapshot.hasData) {
          return DetailsLoadingWidget(screenSize: screenSize);
        }
        if (orders.isEmpty) {
          return DetailsNotFound(
            isDarkMode: isDarkMode,
            screenSize: screenSize,
            title: 'No Orders Available',
          );
        }
        // Split orders by date: Today, Yesterday, Earlier
        List<QueryDocumentSnapshot> todayOrders = [];
        List<QueryDocumentSnapshot> yesterdayOrders = [];
        List<QueryDocumentSnapshot> earlierOrders = [];

        final today = DateTime.now();
        final yesterday = today.subtract(const Duration(days: 1));

        for (var doc in orders) {
          Timestamp orderTimestamp = doc['orderDate'];
          DateTime orderDate = orderTimestamp.toDate();

          if (isSameDate(orderDate, today)) {
            todayOrders.add(doc);
          } else if (isSameDate(orderDate, yesterday)) {
            yesterdayOrders.add(doc);
          } else {
            earlierOrders.add(doc);
          }
        }

         return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (todayOrders.isNotEmpty) ...[
                    TextWidget(
                      text: 'Today',
                      size: screenSize.width / 28,
                      weight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontFamily: 'FarmDairyFontNormal',
                    ),
                    buildOrderList(todayOrders, isDarkMode, screenSize),
                  ],
                  if (yesterdayOrders.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    TextWidget(
                      text: 'Yesterday',
                      size: screenSize.width / 28,
                      weight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontFamily: 'FarmDairyFontNormal',
                    ),
                    buildOrderList(yesterdayOrders, isDarkMode, screenSize),
                  ],
                  if (earlierOrders.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    TextWidget(
                      text: 'Earlier',
                      size: screenSize.width / 28,
                      weight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontFamily: 'FarmDairyFontNormal',
                    ),
                    buildOrderList(earlierOrders, isDarkMode, screenSize),
                  ],
                ],
              ),
            ),
          );
      },
    );
  }
}