import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/available_details_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_loading_widget/details_loading_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_not_found/details_not_found.dart';
import 'package:flutter/material.dart';

class SalesManDetailsHolder extends StatelessWidget {
  const SalesManDetailsHolder({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('salesManDetails').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return DetailsLoadingWidget(screenSize: screenSize);
        }   
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return DetailsNotFound(isDarkMode: isDarkMode, screenSize: screenSize,title: 'No Salesman details available',);
        }    
        final salesManDetails = snapshot.data!.docs;
        return AvailableDetailsWidget(salesManDetails: salesManDetails, screenSize: screenSize, isDarkMode: isDarkMode);
      },
    );
  }
}





