import 'dart:developer';

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

void loginButtonClicked(){
  if(userLoginformkey.currentState!.validate()){
    log(emailController.text);
    log(passwordController.text);
    log(roleController.text);
  }
  else{
    log('Not Logged In');
  }
}