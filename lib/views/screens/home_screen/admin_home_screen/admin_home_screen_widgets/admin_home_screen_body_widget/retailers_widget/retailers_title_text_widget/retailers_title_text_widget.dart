import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RetailersTitleTextWidget extends StatelessWidget {
  const RetailersTitleTextWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: 'Retailers', color: isDarkMode? Colors.white:Colors.black, size: screenSize.width/20, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold);
  }
}