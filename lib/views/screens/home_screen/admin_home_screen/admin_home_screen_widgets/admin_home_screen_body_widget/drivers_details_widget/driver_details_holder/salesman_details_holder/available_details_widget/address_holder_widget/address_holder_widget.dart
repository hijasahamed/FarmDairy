import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/address_widget/address_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_address_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/update_address_widget/update_address_widget.dart';
import 'package:flutter/material.dart';

class AddressHolderWidget extends StatelessWidget {
  const AddressHolderWidget({
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
    return Container(
      padding: EdgeInsets.all(screenSize.width / 50),
      margin: EdgeInsets.symmetric(vertical: screenSize.width / 75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width/75),
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        border: Border.all(
          color: isDarkMode ? Colors.white70 : Colors.grey,
          width: .2
        ),
      ),
      child: Row(
        children: [
          AddressWidget(salesmanName: salesmanName, isDarkMode: isDarkMode, screenSize: screenSize, vehicleNumber: vehicleNumber, location: location, mobileNumber: mobileNumber),
          const Spacer(),
          UpdateAddress(screenSize: screenSize, isDarkMode: isDarkMode,location: location,mobileNumber: mobileNumber,salesmanName: salesmanName,vehicleNumber: vehicleNumber,documentId: documentId,),
          DeleteAddressWidget(screenSize: screenSize, isDarkMode: isDarkMode,documentId: documentId,)
        ],
      ),
    );
  }
}

