import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
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
            loginButtonClicked(context: context);
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
                TextWidget(
                    text: 'Login',
                    color: Colors.white,
                    size: screenSize.width / 23,
                    fontFamily: 'FarmDairyFontNormal',
                    weight: FontWeight.w700),
                SizedBox(
                  width: screenSize.width / 20,
                ),
                if (state is SignUpAndLoginCircularIndicatorState)
                  SizedBox(
                    height: screenSize.width / 15,
                    width: screenSize.width / 15,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: screenSize.width / 150,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}