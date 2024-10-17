import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_loading_widget/details_loading_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_not_found/details_not_found.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/retailers_widget/all_retailers_widget/delete_retailer_dialog/delete_retailer_dialog.dart';
import 'package:flutter/material.dart';

class AllRetailersWidget extends StatelessWidget {
  const AllRetailersWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenSize.width / 75),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: isDarkMode ? Colors.white : Colors.black),
        borderRadius: BorderRadius.circular(screenSize.width / 75),
      ),
      width: screenSize.width,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userSignupData')
            .where('role', isEqualTo: 'Retailer')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DetailsLoadingWidget(screenSize: screenSize);
          }
          if (snapshot.hasError) {
            return DetailsNotFound(
              isDarkMode: isDarkMode,
              screenSize: screenSize,
              title: 'No Data',
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return DetailsNotFound(
              isDarkMode: isDarkMode,
              screenSize: screenSize,
              title: 'No Data',
            );
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var retailerData = snapshot.data!.docs[index];
              String email = retailerData['email'] ?? 'No Email';
              String village = retailerData['village'] ?? 'No Village';
              String docId = retailerData.id; 
              String companyName = email.split('@')[0].toUpperCase();
              return ListTile(
                title: TextWidget(
                  text: companyName,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: screenSize.width / 30,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.bold,
                ),
                subtitle: TextWidget(
                  text: 'Village: $village',
                  color: isDarkMode ? Colors.white54 : Colors.black54,
                  size: screenSize.width / 35,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w600,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: isDarkMode ? Colors.white : Colors.black,size: screenSize.width/25,),
                  onPressed: () {
                    deleteRetailerDialog(context: context,isDarkMode: isDarkMode,screenSize: screenSize,docId: docId);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}