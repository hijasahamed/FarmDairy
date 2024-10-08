import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.email,
  });

  final bool isDarkMode;
  final Size screenSize;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.width/50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Welcome', 
            color: isDarkMode?Colors.white:Colors.blueGrey, 
            size: screenSize.width/20, 
            fontFamily: 'FarmDairyFontNormal', 
            weight: FontWeight.w700
          ),
          TextWidget(
            text: email, 
            color: isDarkMode?Colors.white:Colors.blueGrey, 
            size: screenSize.width/20, 
            fontFamily: 'FarmDairyFontNormal', 
            weight: FontWeight.w700
          ),
        ],
      ),
    );
  }
}