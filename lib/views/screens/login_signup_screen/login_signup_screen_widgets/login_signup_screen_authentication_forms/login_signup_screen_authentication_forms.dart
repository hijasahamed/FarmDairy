import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/add_village_form/add_village_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_email_form/login_signup_screen_email_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_password_form/login_signup_screen_password_form.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/login_signup_screen_role_form/login_signup_screen_role_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignUpScreenAuthenticationForms extends StatelessWidget {
  const LoginSignUpScreenAuthenticationForms({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: userLoginformkey,
      child: BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
        bloc: showAddVillageFormBlocInstance,
        builder: (context, state) {
          return Column(
            children: [
              LoginSignUpScreenEmailForm(screenSize: screenSize, isDarkMode: isDarkMode),
              LoginSignUpScreenPasswordForm(screenSize: screenSize, isDarkMode: isDarkMode),
              LoginSignUpScreenRoleForm(screenSize: screenSize, isDarkMode: isDarkMode),
              AddVillageForm(screenSize: screenSize, isDarkMode: isDarkMode)
            ],
          );
        },
      ),
    );
  }
}
