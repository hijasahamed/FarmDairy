import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MilkStockResult extends StatelessWidget {
  const MilkStockResult(
      {super.key,
      required this.isDarkMode,
      required this.screenSize,
      required this.stock});
  final Size screenSize;
  final bool isDarkMode;
  final dynamic stock;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
            text: 'Milk Stock : ',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 17,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w400),
        TextWidget(
            text: stock.toString(),
            color: const Color(0xFFFD7014),
            size: screenSize.width / 11,
            fontFamily: 'FarmDairyFontBold',
            weight: FontWeight.w400),
        TextWidget(
            text: ' Litres',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 25,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w400),
      ],
    );
  }
}
