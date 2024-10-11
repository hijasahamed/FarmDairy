import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NoOrderWidget extends StatelessWidget {
  const NoOrderWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget(text: 'No Orders Till Now', color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/20, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w400)
    );
  }
}