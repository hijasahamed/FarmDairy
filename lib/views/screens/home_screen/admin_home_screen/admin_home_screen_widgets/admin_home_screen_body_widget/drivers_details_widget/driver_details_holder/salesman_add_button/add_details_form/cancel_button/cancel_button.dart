import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:flutter/material.dart';

class AddSalesManCancelButton extends StatelessWidget {
  const AddSalesManCancelButton({
    super.key,
    required this.screenSize
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        salesmanNameController.clear();
        vehicleNumberController.clear();
        locationController.clear();
        villageController.clear();
        mobileController.clear();
        Navigator.of(context).pop();
      },
      child: TextWidget(
        text: 'Cancel',
        color: Colors.red,
        size: screenSize.width / 30,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}