import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_widgets.dart';
import 'package:flutter/material.dart';


class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: LoginSignUpScreenWidgets(screenSize: screenSize, isDarkMode: isDarkMode),
    );
  }
}