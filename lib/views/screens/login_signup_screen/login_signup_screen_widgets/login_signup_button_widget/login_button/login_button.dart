import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_button_widget/login_button/login_button_text/login_button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
      bloc: signUpAndLoginCircularBlocInstance,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            loginButtonClicked(context: context,screenSize: screenSize);
          },
          child: Ink(
            height: screenSize.height / 20,
            width: screenSize.width / 1.7,
            decoration: BoxDecoration(
                color: const Color(0xFFFD7014),
                borderRadius: BorderRadius.circular(screenSize.width / 75)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is SignUpAndLoginCircularIndicatorState)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginButtonText(screenSize: screenSize),
                      SizedBox(width: screenSize.width / 30),
                      SizedBox(
                        height: screenSize.width / 15,
                        width: screenSize.width / 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: screenSize.width / 150,
                        ),
                      ),
                    ],
                  )
                else
                  LoginButtonText(screenSize: screenSize),
              ],
            ),
          ),
        );
      },
    );
  }
}

