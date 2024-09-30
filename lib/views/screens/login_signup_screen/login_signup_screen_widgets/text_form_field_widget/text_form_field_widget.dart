import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Size screenSize;
  final bool isDarkMode;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.obscureText,
    required this.keyboardType,
    required this.screenSize,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: isDarkMode ? Colors.grey[850] : Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width / 75),
        borderSide: BorderSide(
          color: isDarkMode ? Colors.white70 : Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenSize.width / 75),
        borderSide: const BorderSide(
          color: Color(0xFFFD7014),
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: screenSize.height / 50,
        horizontal: screenSize.width / 25,
      ),
      labelStyle: TextStyle(
        fontFamily: 'FarmDairyFontNormal',
        color: isDarkMode ? Colors.white : Colors.grey[850],
      ),
      labelText: label,
    );

    return TextFormField(
      decoration: inputDecoration,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}