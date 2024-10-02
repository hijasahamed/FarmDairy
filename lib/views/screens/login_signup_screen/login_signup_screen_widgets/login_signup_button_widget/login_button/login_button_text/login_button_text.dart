import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginButtonText extends StatelessWidget {
  const LoginButtonText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
            text: 'Login',
            color: Colors.white,
            size: screenSize.width / 23,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w700),
        SizedBox(
          width: screenSize.width / 20,
        ),
      ],
    );
  }
}