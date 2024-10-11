import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BottomAppTextButtonWidget extends StatelessWidget {
  const BottomAppTextButtonWidget({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      }, 
      child: TextWidget(
        text: 'View My Orders',
        color: isDarkMode?Colors.white:Colors.black,
        size: 16.0,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}