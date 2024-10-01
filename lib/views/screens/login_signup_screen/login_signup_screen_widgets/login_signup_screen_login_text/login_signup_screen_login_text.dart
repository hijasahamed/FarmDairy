import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignUpScreenLoginText extends StatelessWidget {
  const LoginSignUpScreenLoginText({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
          bloc: showSignupFunctionBlocInstance,
          builder: (context, state) {
            if(state is ShowSignupFunctionsWhenCreatingAccountState){
              return TextWidget(
                text: 'SignUp',
                color: const Color(0xFFFD7014),
                size: screenSize.width / 10,
                fontFamily: 'FarmDairyFontBold',
                weight: FontWeight.bold,
              );
            }
            else{
              return TextWidget(
                text: 'Login',
                color: const Color(0xFFFD7014),
                size: screenSize.width / 10,
                fontFamily: 'FarmDairyFontBold',
                weight: FontWeight.bold,
              );
            }
          },
        ),
        SizedBox(height: screenSize.height / 20),
      ],
    );
  }
}
