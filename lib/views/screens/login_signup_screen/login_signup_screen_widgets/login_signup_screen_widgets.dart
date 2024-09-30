import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_email_form/login_signup_screen_email_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_login_text/login_signup_screen_login_text.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_logo_widget/login_signup_screen_logo_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_password_form/login_signup_screen_password_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_role_form/login_signup_screen_role_form.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreenWidgets extends StatelessWidget {
  const LoginSignUpScreenWidgets({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(screenSize.width / 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginSignUpScreenLogo(screenSize: screenSize, isDarkMode: isDarkMode),              
              LoginSignUpScreenLoginText(screenSize: screenSize),              
              LoginSignUpScreenEmailForm(screenSize: screenSize, isDarkMode: isDarkMode), 
              LoginSignUpScreenPasswordForm(screenSize: screenSize, isDarkMode: isDarkMode),              
              LoginSignUpScreenRoleForm(screenSize: screenSize, isDarkMode: isDarkMode),              
            ],
          ),
        ),
      ),
    );
  }
}










