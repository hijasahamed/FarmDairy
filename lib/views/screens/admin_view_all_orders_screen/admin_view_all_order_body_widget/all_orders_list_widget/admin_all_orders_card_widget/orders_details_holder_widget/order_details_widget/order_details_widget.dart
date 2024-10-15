import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.screenSize,
    required this.isDarkMode,
    required this.companyPrefix,
  });

  final QueryDocumentSnapshot<Object?> order;
  final Size screenSize;
  final bool isDarkMode;
  final dynamic companyPrefix;

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
        IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: screenSize.width / 20,
            )),
      ],
    );
  }
}