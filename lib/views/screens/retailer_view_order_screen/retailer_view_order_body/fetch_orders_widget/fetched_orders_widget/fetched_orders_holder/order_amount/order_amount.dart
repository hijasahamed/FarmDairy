import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderAmount extends StatelessWidget {
  const OrderAmount({
    super.key,
    required this.totalAmount,
    required this.isDarkMode,
    required this.screenSize,
  });

  final int totalAmount;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
            text: 'Total Amount: ₹$totalAmount',
            color: isDarkMode ? Colors.white70 : Colors.black87,
            size: screenSize.width / 29,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w500),
        SizedBox(height: screenSize.height / 130),
      ],
    );
  }
}