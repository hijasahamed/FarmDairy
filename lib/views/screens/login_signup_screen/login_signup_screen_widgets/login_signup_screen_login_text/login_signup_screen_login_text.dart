import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreenLoginText extends StatelessWidget {
  const LoginSignUpScreenLoginText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: 'Login',
          color: const Color(0xFFFD7014),
          size: screenSize.width / 10,
          fontFamily: 'FarmDairyFontBold',
          weight: FontWeight.bold,
        ),
        SizedBox(height: screenSize.height / 20),
      ],
    );
  }
}