import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen.dart';
import 'package:farm_dairy/views/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SplashScreenBloc noNetworkLoaderBlocInstance = SplashScreenBloc();

const logedInKey = 'Userlogedin';

Future<void> checkLogging({required context,required Size screenSize,}) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
  final isLogedIn = sharedPreferenceStorageInstance.getBool(logedInKey);
  final role = sharedPreferenceStorageInstance.getString('role');
  final email = sharedPreferenceStorageInstance.getString('email');
  
  // Check if email is null
  if (email == null || email.isEmpty) {
    snackbarMessageWidget(
        text: 'You are Loged Out. Please login again.',
        context: context,
        time: 5000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginSignupScreen(context: context, screenSize: screenSize);
    return;
  }

  // Fetch user data
  dynamic userData;
  try {
    userData = await checkIfUserAvailable(email: email);
  } catch (e) {
    log('Error fetching user data: $e');
    snackbarMessageWidget(
        text: 'Error fetching user data',
        context: context,
        time: 5000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
    return;
  }

  log(isLogedIn.toString());
  log(role.toString());
  if (connectivityResult == ConnectivityResult.none) {
    noNetworkLoaderBlocInstance.add(NoNetworkLoaderEvent());
    snackbarMessageWidget(
        text: 'No Network Connection',
        context: context,
        time: 5000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
  } else if(isLogedIn == null || isLogedIn == false) {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToLoginSignupScreen(context: context, screenSize: screenSize);
  } else if(isLogedIn == true && role == 'Admin') {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToAdminHomeScreen(context: context, screenSize: screenSize);
  } else if(isLogedIn == true && role == 'SalesMan') {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToSalesManHomeScreen(context: context, screenSize: screenSize);
  } else if(isLogedIn == true && role == 'Retailer') {
    await Future.delayed(const Duration(milliseconds: 1500));
    await goToRetailersHomeScreen(context: context, screenSize: screenSize,email: email,userData: userData);
  }
}

Future<void> goToLoginSignupScreen({required context,required Size screenSize,}) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return LoginSignupScreen(screenSize: screenSize,);
  }));
}

Future<void> goToAdminHomeScreen({required context,required Size screenSize,}) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return AdminHomescreen(screenSize: screenSize,);
  }));
}

Future<void> goToSalesManHomeScreen({required context,required Size screenSize,}) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const SalesManHomeScreen();
  }));
}

Future<void> goToRetailersHomeScreen({required context,required Size screenSize,required String email,required dynamic userData}) async {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return RetailerHomeScreen(screenSize: screenSize,email: email,userData: userData,);
  }));
}