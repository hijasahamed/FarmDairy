import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({
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
    return Column(
      children: [
        TextWidget(
            text: title,
            color: isDarkMode ? Colors.white : Colors.black,
            size: screenSize.width / 23,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.bold),
        SizedBox(height: screenSize.height / 130),
      ],
    );
  }
}
