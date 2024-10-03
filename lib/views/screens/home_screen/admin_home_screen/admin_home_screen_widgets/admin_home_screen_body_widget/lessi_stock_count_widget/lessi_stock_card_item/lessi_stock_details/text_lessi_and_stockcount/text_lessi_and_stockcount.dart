import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextStockCount extends StatelessWidget {
  const TextStockCount({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
        text: 'Stock Count:',
        color: isDarkMode ? Colors.white : Colors.blueGrey,
        size: screenSize.width / 25,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.w600);
  }
}

class TextLessi extends StatelessWidget {
  const TextLessi({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    this.isMilkPeda
  });

  final bool isDarkMode;
  final Size screenSize;
  final bool? isMilkPeda;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
        text: (isMilkPeda==true)?'Milk Peda':'Lessi',
        color: isDarkMode ? Colors.white : Colors.blueGrey,
        size: screenSize.width / 20,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.w600);
  }
}