import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/go_to_signup_screen_button_widget/go_to_signup_screen_button_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_authentication_forms/login_signup_screen_authentication_forms.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_button_widget/login_signup_screen_login_button_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_login_text/login_signup_screen_login_text.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_logo_widget/login_signup_screen_logo_widget.dart';
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
              LoginSignUpScreenAuthenticationForms(screenSize: screenSize, isDarkMode: isDarkMode),
              LoginSignupScreenLoginButtonWidget(screenSize: screenSize),              
              GoToSignupScreenButtonWidget(screenSize: screenSize, isDarkMode: isDarkMode)
            ],
          ),
        ),
      ),
    );
  }
}