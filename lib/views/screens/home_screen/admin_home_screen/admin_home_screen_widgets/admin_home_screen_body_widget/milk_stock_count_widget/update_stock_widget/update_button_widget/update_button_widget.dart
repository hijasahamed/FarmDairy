import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    this.isReduceStock
  });

  final Size screenSize;
  final bool isDarkMode;
  final bool? isReduceStock;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: screenSize.height / 15,
      width: screenSize.width / 3,
      decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xFFFD7014)
              : const Color(0xFFFD7014),
          borderRadius: BorderRadius.circular(screenSize.width / 75)),
      child: Center(
          child: TextWidget(
              text: (isReduceStock==true)?'Reduce Stock -': 'Add Stock +',
              color: Colors.white,
              size: screenSize.width / 25,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.bold)),
    );
  }
}