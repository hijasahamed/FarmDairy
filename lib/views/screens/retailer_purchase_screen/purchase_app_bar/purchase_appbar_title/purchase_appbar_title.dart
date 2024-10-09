import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PurchaseAppBarTitleWidget extends StatelessWidget {
  const PurchaseAppBarTitleWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: 'Order Summery', color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500);
  }
}