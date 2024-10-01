import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/models/common_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreenEmailForm extends StatelessWidget {
  const LoginSignUpScreenEmailForm({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          label: 'Email',
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          screenSize: screenSize,
          isDarkMode: isDarkMode,
        ),
        SizedBox(height: screenSize.height / 30),
      ],
    );
  }
}