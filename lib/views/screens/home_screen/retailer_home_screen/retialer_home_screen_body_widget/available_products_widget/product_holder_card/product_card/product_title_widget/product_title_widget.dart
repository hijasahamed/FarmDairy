import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    super.key,
    required this.screenSize,
    required this.title,
    required this.isDarkMode,
  });

  final Size screenSize;
  final String title;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenSize.height / 60),
        TextWidget(
          text: title, 
          color: isDarkMode ? Colors.white : Colors.black, 
          size: screenSize.width / 25, 
          fontFamily: 'FarmDairyFontNormal', 
          weight: FontWeight.bold
        ),
      ],
    );
  }
}