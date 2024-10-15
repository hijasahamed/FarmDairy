import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderTitleText extends StatelessWidget {
  const OrderTitleText({
    super.key,
    required this.title,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String title;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: title,
      color: isDarkMode ? Colors.white : Colors.black,
      size: screenSize.width / 25,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.bold,
    );
  }
}