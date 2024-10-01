import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Ink(
        height: screenSize.height/20,
        width: screenSize.width/1.7,
        decoration: BoxDecoration(
          color: const Color(0xFFFD7014),
          borderRadius: BorderRadius.circular(screenSize.width/75)
        ),
        child: Center(child: TextWidget(text: 'Sign Up', color: Colors.white, size: screenSize.width/23, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w700)),
      ),
    );
  }
}