import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LatestOrdersTextWidget extends StatelessWidget {
  const LatestOrdersTextWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: 'Latest Orders', color: isDarkMode ? Colors.white : Colors.black, size: screenSize.width/35, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w800);
  }
}