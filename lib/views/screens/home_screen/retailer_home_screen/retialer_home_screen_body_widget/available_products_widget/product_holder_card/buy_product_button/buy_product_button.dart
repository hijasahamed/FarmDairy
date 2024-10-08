import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BuyProductButton extends StatelessWidget {
  const BuyProductButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.imageUrl,
    required this.title,
    required this.price,
  });
  final Size screenSize;
  final bool isDarkMode;
  final String imageUrl;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      }, 
      child: TextWidget(text: 'Buy Product', color: Colors.blue, size: screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w200)
    );
  }
}