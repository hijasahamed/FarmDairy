import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

Widget buildOrderList(
    List<QueryDocumentSnapshot> orders, bool isDarkMode, Size screenSize) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: orders.length,
    itemBuilder: (context, index) {
      var order = orders[index];
      return Card(
        color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: order['title'],
                size: screenSize.width / 30,
                weight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
                fontFamily: 'FarmDairyFontNormal',
              ),
              const SizedBox(height: 4),
              TextWidget(
                text: 'Email: ${order['email']}',
                size: screenSize.width / 32,
                color: isDarkMode ? Colors.white70 : Colors.black87,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w500,
              ),
              TextWidget(
                text: 'Item Count: ${order['itemCount']}',
                size: screenSize.width / 32,
                color: isDarkMode ? Colors.white70 : Colors.black87,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w500,
              ),
              TextWidget(
                text: 'Total Amount: ${order['totalAmount']}',
                size: screenSize.width / 32,
                color: isDarkMode ? Colors.white70 : Colors.black87,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w500,
              ),
              TextWidget(
                text: 'Order Status: ${order['update']}',
                size: screenSize.width / 32,
                color: isDarkMode ? Colors.white70 : Colors.black87,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: TextWidget(
                  text: DateFormat.yMMMd()
                      .add_jm()
                      .format(order['orderDate'].toDate()),
                  size: screenSize.width / 32,
                  color: isDarkMode ? Colors.white54 : Colors.black54,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
