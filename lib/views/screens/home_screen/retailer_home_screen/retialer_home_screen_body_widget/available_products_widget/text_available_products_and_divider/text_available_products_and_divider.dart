import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextAvailableProductsAndDivider extends StatelessWidget {
  const TextAvailableProductsAndDivider({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Available Products', 
          color: isDarkMode?Colors.green:Colors.green, 
          size: screenSize.width/15, 
          fontFamily: 'FarmDairyFontNormal', 
          weight: FontWeight.w500
        ),
        Divider(color: Colors.grey,thickness: screenSize.width/500,),
        SizedBox(height: screenSize.width/75,)
      ],
    );
  }
}