import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SalesTeamTextWidget extends StatelessWidget {
  const SalesTeamTextWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'Sales Team',
      color: isDarkMode? Colors.white:Colors.black,
      size: screenSize.width / 20,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.bold
    );
  }
}