import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FormBackButton extends StatelessWidget {
  const FormBackButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: TextWidget(
        text: 'Cancel',
        color: isDarkMode ? Colors.white : Colors.black,
        size: screenSize.width / 30,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.normal,
      ),
    );
  }
}