import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/delete_salesman_form.dart';
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
            return DeleteSalesManForm(isDarkMode: isDarkMode, screenSize: screenSize, documentId: documentId);
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