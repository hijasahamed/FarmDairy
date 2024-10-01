import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/models/common_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreenRoleForm extends StatelessWidget {
  const LoginSignUpScreenRoleForm({
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
          controller: roleController,
          label: 'Role',
          obscureText: false,
          keyboardType: TextInputType.none,
          screenSize: screenSize,
          isDarkMode: isDarkMode,
          isRole: true,
        ),
        SizedBox(height: screenSize.height / 20),
      ],
    );
  }
}