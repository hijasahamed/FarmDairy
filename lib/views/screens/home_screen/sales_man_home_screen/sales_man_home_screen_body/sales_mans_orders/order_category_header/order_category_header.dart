import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderCategoryHeader extends StatelessWidget {
  const OrderCategoryHeader(
      {super.key,
      required this.title,
      required this.isDarkMode,
      required this.screenSize});

  final String title;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextWidget(
      text: title,
      color: (title=="Today's Orders")?Colors.green:Colors.blue,
      size: screenSize.width / 25,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.bold)
    );
  }
}
