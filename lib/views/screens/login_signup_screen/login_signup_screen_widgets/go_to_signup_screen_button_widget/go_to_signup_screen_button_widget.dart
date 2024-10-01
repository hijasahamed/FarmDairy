import 'package:farm_dairy/controllers/login_signup_screen_functions.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/go_to_signup_screen_button_widget/back_to_login_button/back_to_login_button.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/go_to_signup_screen_button_widget/create_account_button_widget/create_account_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoToSignupScreenButtonWidget extends StatelessWidget {
  const GoToSignupScreenButtonWidget(
      {super.key, required this.screenSize, required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
      bloc: showSignupFunctionBlocInstance,
      builder: (context, state) {
        if(state is ShowSignupFunctionsWhenCreatingAccountState){
          return BackToLoginButton(screenSize: screenSize, isDarkMode: isDarkMode);
        }
        return CreateAccountButton(screenSize: screenSize, isDarkMode: isDarkMode);
      },
    );
  }
}

