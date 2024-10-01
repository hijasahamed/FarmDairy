import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:flutter/material.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({
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
        SizedBox(
          height: screenSize.height / 20,
        ),
        TextButton(
            onPressed: () {
              showSignupFunctionBlocInstance
                  .add(ShowLoginFunctionsWhenCreatingAccountEvent());
            },
            child: TextWidget(
                text: 'Back to login',
                color: isDarkMode ? Colors.white : Colors.black,
                size: screenSize.width / 23,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w400))
      ],
    );
  }
}
