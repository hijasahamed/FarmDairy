import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:flutter/material.dart';

class UpdateAddress extends StatelessWidget {
  const UpdateAddress({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.salesmanName,
    required this.vehicleNumber,
    required this.location,
    required this.mobileNumber,
    required this.documentId
  });

  final Size screenSize;
  final bool isDarkMode;
  final String salesmanName;
  final String vehicleNumber;
  final String location;
  final String mobileNumber;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showAddSalesmanDialog(
          context: context, 
          screenSize: screenSize, 
          isDarkMode: isDarkMode,
          iseditSaleMan: true,
          location: location,
          mobileNumber: mobileNumber,
          salesmanName: salesmanName,
          vehicleNumber: vehicleNumber,
          documentId: documentId
        );
      }, 
      icon: Icon(
        Icons.edit,
        size: screenSize.width/25,
        color: isDarkMode?Colors.white:Colors.black,
      )
    );
  }
}