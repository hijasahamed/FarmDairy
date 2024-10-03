import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextAvailablePcs extends StatelessWidget {
  const TextAvailablePcs({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenSize.width/50),
      child: TextWidget(
      text: 'PCS Available',
      color: Colors.green,
      size: screenSize.width / 35,
      fontFamily: 'FarmDairyFontNormal',
      weight: FontWeight.w400),
    );
  }
}