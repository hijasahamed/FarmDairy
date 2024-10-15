import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderDateText extends StatelessWidget {
  const OrderDateText({
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
    return TextWidget(
      text:
          'Order Date: ${orderDate.toLocal().toString().split(' ')[0]}',
      color: isDarkMode ? Colors.white : Colors.black,
      size: screenSize.width / 30,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.normal,
    );
  }
}