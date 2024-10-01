import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_login_button_widget/login_button/login_button.dart';
import 'package:flutter/material.dart';

class LoginSignupScreenLoginButtonWidget extends StatelessWidget {
  const LoginSignupScreenLoginButtonWidget({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        loginButtonClicked();
      },
      child: LoginButton(screenSize: screenSize),
    );
  }
}

