import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderUpdate extends StatelessWidget {
  const OrderUpdate({
    super.key,
    required this.update,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String update;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
        text: update,
        color: (update == 'Order Placed')?Colors.blue:Colors.green,
        size: screenSize.width / 29,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.w500);
  }
}