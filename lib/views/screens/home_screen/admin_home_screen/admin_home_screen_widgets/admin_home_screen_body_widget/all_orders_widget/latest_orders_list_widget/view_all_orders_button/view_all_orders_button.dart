import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ViewAllOrdersButton extends StatelessWidget {
  const ViewAllOrdersButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      }, 
      child: TextWidget(text: 'View All Orders', color: isDarkMode ? Colors.white : Colors.black87, size: screenSize.width/29, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500)
    );
  }
}