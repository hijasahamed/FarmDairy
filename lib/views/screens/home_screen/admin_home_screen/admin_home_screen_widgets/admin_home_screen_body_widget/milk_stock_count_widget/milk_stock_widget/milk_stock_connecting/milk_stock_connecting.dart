import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MilkStockConnectingWidget extends StatelessWidget {
  const MilkStockConnectingWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
            text: 'Milk Stock : ',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 15,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w400
        ),
        TextWidget(
            text: 'Loading...',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 15,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w400
        ),
      ],
    );
  }
}