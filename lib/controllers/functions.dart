import 'package:connectivity/connectivity.dart';
import 'package:farm_dairy/views/widgets/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/users_role_screen/users_role_screen.dart';
import 'package:flutter/material.dart';

Future<void> checkLogging({required context,required Size screenSize,required bool isDarkMode }) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    snackbarMessageWidget(
        text: 'No Network Connection',
        context: context,
        time: 2000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
  } else {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return UsersRoleScreen(screenSize: screenSize,isDarkMode: isDarkMode,);
    }));
  }
}
