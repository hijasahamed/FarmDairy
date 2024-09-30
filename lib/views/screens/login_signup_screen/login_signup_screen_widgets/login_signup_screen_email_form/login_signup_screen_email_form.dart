import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/text_form_field_widget/text_form_field_widget.dart';
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