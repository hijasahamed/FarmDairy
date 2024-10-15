import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/orders_details_holder_widget/order_details_widget/delete_order_button_widget/delete_order_button_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.screenSize,
    required this.isDarkMode,
    required this.companyPrefix,
    required this.documentId
  });

  final QueryDocumentSnapshot<Object?> order;
  final Size screenSize;
  final bool isDarkMode;
  final dynamic companyPrefix;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: order['title'],
              size: screenSize.width / 30,
              weight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
              fontFamily: 'FarmDairyFontNormal',
            ),
            const SizedBox(height: 4),
            TextWidget(
              text: companyPrefix,
              size: screenSize.width / 32,
              color: isDarkMode ? Colors.white70 : Colors.black87,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Email: ${order['email']}',
              size: screenSize.width / 32,
              color: isDarkMode ? Colors.white70 : Colors.black87,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Item Count: ${order['itemCount']}',
              size: screenSize.width / 32,
              color: isDarkMode ? Colors.white70 : Colors.black87,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Total Amount: ${order['totalAmount']}',
              size: screenSize.width / 32,
              color: isDarkMode ? Colors.white70 : Colors.black87,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
          ],
        ),
        const Spacer(),
        DeleteOrderButtonWidget(documentId: documentId, screenSize: screenSize,isDarkMode: isDarkMode,),
      ],
    );
  }
}

