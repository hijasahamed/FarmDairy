import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/role_drop_down_button_widget/role_drop_down_button_widget.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Size screenSize;
  final bool isDarkMode;
  final TextEditingController controller;
  final bool? isRole;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.obscureText,
    required this.keyboardType,
    required this.screenSize,
    required this.isDarkMode,
    required this.controller,
    this.isRole
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
      suffixIcon: (isRole==true)?
      RoleDropDownButtonWidget(screenSize: screenSize,isDarkMode: isDarkMode,):null
    );

    return TextFormField(
      controller: controller,
      decoration: inputDecoration,
      style: TextStyle(color: isDarkMode? Colors.white:Colors.black),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (label == 'Email') {
          final emailRegex = RegExp(
            r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
          );
          if (!emailRegex.hasMatch(value)) {
            return 'Enter a valid email address';
          }
        } else if (label == 'Password') {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }
        return null; 
      },
    );
  }
}