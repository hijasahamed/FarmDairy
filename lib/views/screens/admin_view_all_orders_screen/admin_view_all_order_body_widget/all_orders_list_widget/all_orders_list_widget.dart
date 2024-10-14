import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/admin_all_orders_card_widget.dart';
import 'package:flutter/material.dart';

class AllOrdersListWidget extends StatelessWidget {
  const AllOrdersListWidget({
    super.key,
    required this.todayOrders,
    required this.screenSize,
    required this.isDarkMode,
    required this.yesterdayOrders,
    required this.earlierOrders,
  });

  final List<QueryDocumentSnapshot<Object?>> todayOrders;
  final Size screenSize;
  final bool isDarkMode;
  final List<QueryDocumentSnapshot<Object?>> yesterdayOrders;
  final List<QueryDocumentSnapshot<Object?>> earlierOrders;

  @override
  Widget build(BuildContext context) {
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
              adminAllOrdersCardWidget(todayOrders, isDarkMode, screenSize),
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
              adminAllOrdersCardWidget(yesterdayOrders, isDarkMode, screenSize),
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
              adminAllOrdersCardWidget(earlierOrders, isDarkMode, screenSize),
            ],
          ],
        ),
      ),
    );
  }
}