// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_back_button/form_back_button.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_content/form_content.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_delete_button/form_delete_button.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_title/form_title.dart';
import 'package:flutter/material.dart';

class DeleteSalesManForm extends StatelessWidget {
  const DeleteSalesManForm({
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
    // final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDarkMode?const Color.fromARGB(255, 36, 35, 35):Colors.white,
      title: FormTitle(isDarkMode: isDarkMode, screenSize: screenSize),
      content:
          FormContent(isDarkMode: isDarkMode, screenSize: screenSize),
      actions: [
        FormBackButton(isDarkMode: isDarkMode, screenSize: screenSize),
        FormDeleteButton(documentId: documentId, screenSize: screenSize),
      ],
    );
  }
}