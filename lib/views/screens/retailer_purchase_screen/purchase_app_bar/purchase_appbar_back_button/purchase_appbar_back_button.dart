import 'package:flutter/material.dart';

class PurchaseAppBackButtonWidget extends StatelessWidget {
  const PurchaseAppBackButtonWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      }, 
      icon: Icon(Icons.arrow_back_ios_new_rounded,size: screenSize.width/15,color: isDarkMode?Colors.white:Colors.black,)
    );
  }
}