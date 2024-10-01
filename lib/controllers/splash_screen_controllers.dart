import 'package:connectivity/connectivity.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen.dart';
import 'package:farm_dairy/views/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';

SplashScreenBloc noNetworkLoaderBlocInstance = SplashScreenBloc();

Future<void> checkLogging({required context,required Size screenSize,}) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    noNetworkLoaderBlocInstance.add(NoNetworkLoaderEvent());
    snackbarMessageWidget(
        text: 'No Network Connection',
        context: context,
        time: 5000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
  } else {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToUserRoleScreen(context: context, screenSize: screenSize);
  }
}

Future<void> goToUserRoleScreen({required context,required Size screenSize,}) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return LoginSignupScreen(screenSize: screenSize,);
  }));
}
