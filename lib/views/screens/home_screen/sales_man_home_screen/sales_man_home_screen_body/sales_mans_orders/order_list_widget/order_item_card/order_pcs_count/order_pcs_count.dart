import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderPcsCount extends StatelessWidget {
  const OrderPcsCount({
    super.key,
    required this.itemCount,
    required this.isDarkMode,
    required this.screenSize,
  });

  final int itemCount;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: '$itemCount PCS',
      color: isDarkMode ? Colors.white : Colors.black,
      size: screenSize.width / 30,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.bold,
    );
  }
}