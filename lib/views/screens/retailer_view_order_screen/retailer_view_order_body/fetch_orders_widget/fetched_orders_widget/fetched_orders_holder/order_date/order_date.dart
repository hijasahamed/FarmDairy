import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDate extends StatelessWidget {
  const OrderDate({
    super.key,
    required this.orderDate,
    required this.isDarkMode,
    required this.screenSize,
  });

  final DateTime orderDate;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
            text:
                'Order Date: ${DateFormat('dd-MM-yyyy').format(orderDate)}',
            color: isDarkMode ? Colors.white70 : Colors.black87,
            size: screenSize.width / 29,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w500),
        SizedBox(height: screenSize.height / 130),
      ],
    );
  }
}