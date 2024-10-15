import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EarlierTextWidget extends StatelessWidget {
  const EarlierTextWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'Earlier',
      size: screenSize.width / 28,
      weight: FontWeight.bold,
      color: isDarkMode ? Colors.white : Colors.black,
      fontFamily: 'FarmDairyFontNormal',
    );
  }
}