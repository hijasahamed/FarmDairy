// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:farm_dairy/controllers/firebase_controllers.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:flutter/material.dart';

LoginSignupScreenBloc showSignupFunctionBlocInstance = LoginSignupScreenBloc();

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

TextEditingController roleController = TextEditingController();

final GlobalKey<FormState> userLoginformkey = GlobalKey<FormState>();

String? selectedDropDownItem;

final List<String> dropDownItems = [
  'Admin',
  'SalesMan',
  'Retailer',
];

void loginButtonClicked({required BuildContext context})async{
  if(userLoginformkey.currentState!.validate()){
    await auth.userLogin(context: context,email: emailController.text,password: passwordController.text);
  }
  else{
    log('Not Logged In');
  }
}

void signUpButtonClicked({required BuildContext context}) async {
  if (userLoginformkey.currentState!.validate()) {
    try {
      await auth.userSignup(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      log('SignUp Failed: $e');      
    }
  } else {
    snackbarMessageWidget(
        text: 'Provide Correct Details',
        context: context,
        time: 3000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      );
  }
}