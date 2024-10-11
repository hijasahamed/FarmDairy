// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/bloc/retailer_view_order_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveOrderAlertDialog extends StatelessWidget {
  const RemoveOrderAlertDialog({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.documentId,
  });

  final bool isDarkMode;
  final Size screenSize;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    RetailerViewOrderScreenBloc deleteOrderCircularBlocInstance = RetailerViewOrderScreenBloc();
    return AlertDialog(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      title: TextWidget(
        text: 'Confirm Deletion',
        color: isDarkMode ? Colors.white : Colors.black,
        size: screenSize.width / 25,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
      content: TextWidget(
        text: 'Are you sure you want to delete this order?',
        color: isDarkMode ? Colors.white70 : Colors.black87,
        size: screenSize.width / 29,
        fontFamily: 'FarmDairyFontNormal',
        maxline: true,
        weight: FontWeight.w500,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget(
            text: 'Cancel',
            color: isDarkMode ? Colors.white : Colors.black,
            size: screenSize.width / 29,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () async {
            try {
              deleteOrderCircularBlocInstance.add(DeleteOrderCircularIndicatorEvent());
              await FirebaseFirestore.instance
                  .collection('productOrders')
                  .doc(documentId)
                  .delete();
              snackbarMessageWidget(
                  text: 'Order Cancelled',
                  context: context,
                  color: Colors.green,
                  textColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  time: 3000);
            } catch (e) {
              snackbarMessageWidget(
                  text: 'Failed To Cancel Order',
                  context: context,
                  color: Colors.red,
                  textColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  time: 3000);
            }
            Navigator.of(context).pop();
          },
          child: BlocBuilder<RetailerViewOrderScreenBloc, RetailerViewOrderScreenState>(
            bloc: deleteOrderCircularBlocInstance,
            builder: (context, state) {
              if(state is DeleteOrderCircularIndicatorState){
                return const CircularProgressIndicator();
              }
              else {
                return TextWidget(
                  text: 'Delete',
                  color: Colors.red,
                  size: screenSize.width / 29,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.bold,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
