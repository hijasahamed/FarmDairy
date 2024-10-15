import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderNameText extends StatelessWidget {
  const OrderNameText({
    super.key,
    required this.email,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String email;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'From ${email.split('@')[0].toUpperCase()}',
      color: isDarkMode ? Colors.white : Colors.black,
      size: screenSize.width / 30,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.bold,
    );
  }
}