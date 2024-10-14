import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.title
  });

  final bool isDarkMode;
  final Size screenSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: title, color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/30, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold);
  }
}