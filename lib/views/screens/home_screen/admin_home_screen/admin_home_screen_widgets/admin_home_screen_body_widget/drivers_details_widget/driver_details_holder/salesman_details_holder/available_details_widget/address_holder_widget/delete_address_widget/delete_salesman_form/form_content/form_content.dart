import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FormContent extends StatelessWidget {
  const FormContent({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'Are you sure you want to delete this address?',
      color: isDarkMode ? Colors.white70 : Colors.black87,
      size: screenSize.width / 25,
      fontFamily: 'FarmDairyFontNormal',
      maxline: true,
      weight: FontWeight.normal,
    );
  }
}