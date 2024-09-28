import 'package:connectivity/connectivity.dart';
import 'package:farm_dairy/models/common_widgets_model/snack_bar_message_widget.dart';
import 'package:flutter/material.dart';

Future<void> checkLogging({required context}) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    snackbarMessageWidget(
        text: 'No Network Connection',
        context: context,
        time: 2000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating);
  }
}
