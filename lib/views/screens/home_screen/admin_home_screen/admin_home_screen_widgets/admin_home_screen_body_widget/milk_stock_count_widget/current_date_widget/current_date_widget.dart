import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CurrentDateWidget extends StatelessWidget {
  const CurrentDateWidget({
    super.key,
    required this.formattedDate,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String formattedDate;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: 'Today: $formattedDate',
          color: isDarkMode ? Colors.white : Colors.blueGrey,
          size: screenSize.width / 20,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w400,
        ),
        SizedBox(height: screenSize.height / 60),
      ],
    );
  }
}