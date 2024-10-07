import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:flutter/material.dart';

class DeleteAddressWidget extends StatelessWidget {
  const DeleteAddressWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.documentId
  });

  final Size screenSize;
  final bool isDarkMode;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteSalesMan(documentId: documentId, context: context);
      }, 
      icon: Icon(
        Icons.delete,
        size: screenSize.width/25,
        color: isDarkMode?Colors.white:Colors.black,
      )
    );
  }
}