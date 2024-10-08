import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DeleteAddressWidget extends StatelessWidget {
  const DeleteAddressWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.documentId,
  });

  final Size screenSize;
  final bool isDarkMode;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: TextWidget(
                text: 'Confirm Deletion',
                color: isDarkMode ? Colors.white : Colors.black,
                size: screenSize.width / 20,
                fontFamily: 'Roboto',
                weight: FontWeight.bold,
              ),
              content: TextWidget(
                text: 'Are you sure you want to delete this address?',
                color: isDarkMode ? Colors.white70 : Colors.black87,
                size: screenSize.width / 25,
                fontFamily: 'Roboto',
                weight: FontWeight.normal,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: TextWidget(
                    text: 'Cancel',
                    color: isDarkMode ? Colors.white : Colors.black,
                    size: screenSize.width / 30,
                    fontFamily: 'Roboto',
                    weight: FontWeight.normal,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    deleteSalesMan(documentId: documentId, context: context);
                    Navigator.of(context).pop(); // Close the dialog after deletion
                  },
                  child: TextWidget(
                    text: 'Delete',
                    color: Colors.red,
                    size: screenSize.width / 30,
                    fontFamily: 'Roboto',
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        Icons.delete,
        size: screenSize.width / 25,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}