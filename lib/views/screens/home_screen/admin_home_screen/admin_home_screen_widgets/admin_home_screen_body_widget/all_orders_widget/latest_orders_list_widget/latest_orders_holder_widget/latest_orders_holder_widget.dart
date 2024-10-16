import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_loading_widget/details_loading_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/details_not_found/details_not_found.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestOrdersHolderWidget extends StatelessWidget {
  const LatestOrdersHolderWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productOrders')
          .orderBy('orderDate', descending: true)
          .limit(3)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return DetailsLoadingWidget(screenSize: screenSize);
        }
        var orders = snapshot.data!.docs;
        if (orders.isEmpty) {
          return DetailsNotFound(
            isDarkMode: isDarkMode,
            screenSize: screenSize,
            title: 'No Orders Available',
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            var orderData = orders[index].data() as Map<String, dynamic>;
            var email = orderData['email'] ?? 'Unknown Email';
            var orderDate = orderData['orderDate'].toDate();
            var title = orderData['title'] ?? 'Unknown Title';
            var village = orderData['village'] ?? 'Unknown Village';
            var updateStatus = orderData['update'] ?? 'Unknown Status';
            var itemCount = orderData['itemCount'] ?? 0;
            var emailPrefix = email.split('@')[0];
            var formattedDate = DateFormat('dd/MM/yyyy').format(orderDate);

            return Card(
              color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height / 200,
                horizontal: screenSize.width / 50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenSize.width / 75),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenSize.width / 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: emailPrefix.toString().toUpperCase(),
                      color: isDarkMode ? Colors.white : Colors.black87,
                      size: screenSize.width / 35,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w800,
                    ),
                    SizedBox(height: screenSize.height / 300),
                    TextWidget(
                      text: 'Product: $title',
                      color: isDarkMode ? Colors.white70 : Colors.blueGrey,
                      size: screenSize.width / 38,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: screenSize.height / 300),
                    TextWidget(
                      text: 'Order Date: $formattedDate',
                      color: isDarkMode ? Colors.white70 : Colors.blueGrey,
                      size: screenSize.width / 38,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: screenSize.height / 300),
                    TextWidget(
                      text: 'Deliver To: $village',
                      color: isDarkMode ? Colors.white70 : Colors.blueGrey,
                      size: screenSize.width / 38,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: screenSize.height / 300),
                    TextWidget(
                      text: '$itemCount PCS',
                      color: isDarkMode ? Colors.white70 : Colors.blueGrey,
                      size: screenSize.width / 38,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: screenSize.height / 300),
                    TextWidget(
                      text: '$updateStatus',
                      color: (updateStatus=='Order Placed'?Colors.blue:(updateStatus=='Delivered')?Colors.green:Colors.orange),
                      size: screenSize.width / 38,
                      fontFamily: 'FarmDairyFontNormal',
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
