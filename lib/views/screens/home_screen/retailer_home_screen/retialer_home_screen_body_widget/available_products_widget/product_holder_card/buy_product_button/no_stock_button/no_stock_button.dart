import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NoStockButton extends StatelessWidget {
  const NoStockButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        snackbarMessageWidget(text: 'No Stock Available In Company', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
      }, 
      child: TextWidget(
        text: 'Product Out Of Stock', 
        color: Colors.grey, 
        size: screenSize.width/25, 
        fontFamily: 'FarmDairyFontNormal', 
        weight: FontWeight.w200
      )
    );
  }
}