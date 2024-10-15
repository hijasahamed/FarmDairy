import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
    required this.salesmanData,
    required this.isDarkMode,
    required this.screenSize,
  });

  final SalesmanData salesmanData;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Hello ${salesmanData.salesManName}',
          color: isDarkMode ? Colors.white : Colors.blueGrey,
          size: screenSize.width / 15,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
          maxline: true,
        ),
        SizedBox(height: screenSize.height/200,),
        TextWidget(
          text: 'Your orders from ${salesmanData.location}',
          color: isDarkMode ? Colors.white : Colors.blueGrey,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w700,
          maxline: true,
        ),
        SizedBox(height: screenSize.height/70,),
      ],
    );
  }
}