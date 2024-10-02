import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignUpButtonText extends StatelessWidget {
  const SignUpButtonText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
            text: 'Sign Up',
            color: Colors.white,
            size: screenSize.width / 23,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w700),
        SizedBox(width: screenSize.width/20,),
      ],
    );
  }
}