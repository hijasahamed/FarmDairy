import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DetailsNotFound extends StatelessWidget {
  const DetailsNotFound({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget(text: 'No Salesman details available', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width / 30, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
    );
  }
}