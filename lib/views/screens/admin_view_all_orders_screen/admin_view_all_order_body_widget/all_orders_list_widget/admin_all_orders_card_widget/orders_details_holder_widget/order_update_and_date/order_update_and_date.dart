import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderUpdateAndDate extends StatelessWidget {
  const OrderUpdateAndDate({
    super.key,
    required this.order,
    required this.screenSize,
    required this.isDarkMode,
  });

  final QueryDocumentSnapshot<Object?> order;
  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: '${order['update']}',
          size: screenSize.width / 32,
          color: (order['update'] == 'Order Placed')
              ? Colors.blue
              : (order['update'] == 'Deliverd')
                  ? Colors.green
                  : Colors.grey,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w500,
        ),
        const Spacer(),
        TextWidget(
          text: DateFormat.yMMMd()
              .add_jm()
              .format(order['orderDate'].toDate()),
          size: screenSize.width / 32,
          color: isDarkMode ? Colors.white54 : Colors.black54,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}