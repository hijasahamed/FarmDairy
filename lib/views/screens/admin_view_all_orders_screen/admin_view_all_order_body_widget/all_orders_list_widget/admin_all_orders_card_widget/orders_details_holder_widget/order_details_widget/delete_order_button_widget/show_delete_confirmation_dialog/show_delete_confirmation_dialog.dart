import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:flutter/material.dart';

void showDeleteConfirmationDialog({required BuildContext context,required bool isDarkMode,required Size screenSize,required String documentId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Order',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this order?',
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () {
                deleteRetailersOrder(context: context, isDarkMode: isDarkMode, screenSize: screenSize, documentId: documentId);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }