import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/address_holder_widget.dart';
import 'package:flutter/material.dart';

class AvailableDetailsWidget extends StatelessWidget {
  const AvailableDetailsWidget({
    super.key,
    required this.salesManDetails,
    required this.screenSize,
    required this.isDarkMode,
  });

  final List<QueryDocumentSnapshot<Object?>> salesManDetails;
  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(  
      physics: const NeverScrollableScrollPhysics(),        
      shrinkWrap: true,
      itemCount: salesManDetails.length,
      itemBuilder: (context, index) {
        final data = salesManDetails[index];
        final salesmanName = data['salesmanName'] ?? 'N/A';
        final vehicleNumber = data['vehicleNumber'] ?? 'N/A';
        final location = data['location'] ?? 'N/A';
        final mobileNumber = data['mobileNumber'] ?? 'N/A';
        final documentId = data.id;

        return AddressHolderWidget(screenSize: screenSize, isDarkMode: isDarkMode, salesmanName: salesmanName, vehicleNumber: vehicleNumber, location: location, mobileNumber: mobileNumber,documentId: documentId,);
      },
    );
  }
}

