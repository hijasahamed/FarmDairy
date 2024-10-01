import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        color: const Color(0xFFFD7014),
        borderRadius: BorderRadius.circular(screenSize.width/75)
      );
    return Ink(
      height: screenSize.height/17,
      width: screenSize.width/1.3,
      decoration: boxDecoration,
      child: Center(child: TextWidget(text: 'Login', color: Colors.white, size: screenSize.width/17, fontFamily: 'FarmDairyFontBold', weight: FontWeight.bold)),
    );
  }
}