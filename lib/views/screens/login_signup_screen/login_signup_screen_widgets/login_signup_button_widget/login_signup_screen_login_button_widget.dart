import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_button_widget/login_button/login_button.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_button_widget/signup_button/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupScreenLoginButtonWidget extends StatelessWidget {
  const LoginSignupScreenLoginButtonWidget(
      {super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
      bloc: showSignupFunctionBlocInstance,
      builder: (context, state) {
        if(state is ShowSignupFunctionsWhenCreatingAccountState){
          return SignUpButton(screenSize: screenSize); 
        }
        else{
          return LoginButton(screenSize: screenSize);
        }
      },
    );
  }
}