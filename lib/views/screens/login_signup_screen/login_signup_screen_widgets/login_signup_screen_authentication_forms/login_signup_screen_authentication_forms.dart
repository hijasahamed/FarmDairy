import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_email_form/login_signup_screen_email_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_password_form/login_signup_screen_password_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_role_form/login_signup_screen_role_form.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreenAuthenticationForms extends StatelessWidget {
  const LoginSignUpScreenAuthenticationForms({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userLoginformkey,
      child: Column(
        children: [
          LoginSignUpScreenEmailForm(screenSize: screenSize, isDarkMode: isDarkMode), 
          LoginSignUpScreenPasswordForm(screenSize: screenSize, isDarkMode: isDarkMode),              
          LoginSignUpScreenRoleForm(screenSize: screenSize, isDarkMode: isDarkMode),
        ],
      ),
    );
  }
}