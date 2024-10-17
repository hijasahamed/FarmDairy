import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

Future<dynamic> deleteRetailerDialog(
    {required BuildContext context,
    required Size screenSize,
    required String docId,
    required bool isDarkMode}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextWidget(
          text: 'Delete Retailer',
          color: isDarkMode ? Colors.white : Colors.black,
          size: screenSize.width / 30,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
        ),
        content: TextWidget(
          text: 'Are you sure you want to delete this retailer?',
          color: isDarkMode ? Colors.white54 : Colors.black54,
          size: screenSize.width / 35,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.normal,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: TextWidget(
              text: 'Cancel',
              color: isDarkMode ? Colors.white54 : Colors.black54,
              size: screenSize.width / 35,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              deleteRetailer(docId: docId, context: context);
              Navigator.of(context).pop();
            },
            child: TextWidget(
              text: 'Delete',
              color: Colors.redAccent,
              size: screenSize.width / 35,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.bold,
            ),
          ),
        ],
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      );
    },
  );
}