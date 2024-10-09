import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class StockAvailableButton extends StatelessWidget {
  const StockAvailableButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      }, 
      child: TextWidget(
        text: 'Buy Product', 
        color: Colors.blue, 
        size: screenSize.width/25, 
        fontFamily: 'FarmDairyFontNormal', 
        weight: FontWeight.w200
      )
    );
  }
}