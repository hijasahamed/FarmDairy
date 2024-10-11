import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FetchedOrdersHolder extends StatelessWidget {
  const FetchedOrdersHolder({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.title,
    required this.orderDate,
    required this.itemCount,
    required this.totalAmount,
    required this.update,
  });

  final bool isDarkMode;
  final Size screenSize;
  final String title;
  final DateTime orderDate;
  final int itemCount;
  final int totalAmount;
  final String update;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDarkMode ? Colors.grey[900] : const Color.fromARGB(255, 241, 241, 241),
      margin: EdgeInsets.all(screenSize.width/75),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width/30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: title, color: isDarkMode ? Colors.white : Colors.black, size: screenSize.width/23, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
            SizedBox(height: screenSize.height/130),                    
            TextWidget(text: 'Order Date: ${DateFormat('dd-MM-yyyy').format(orderDate)}', color: isDarkMode ? Colors.white70 : Colors.black87, size: screenSize.width/29, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500),
            SizedBox(height: screenSize.height/130),                  
            TextWidget(text: 'Item Count: $itemCount', color: isDarkMode ? Colors.white70 : Colors.black87, size: screenSize.width/29, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500),
            SizedBox(height: screenSize.height/130),
            TextWidget(text: 'Total Amount: ₹$totalAmount', color: isDarkMode ? Colors.white70 : Colors.black87, size: screenSize.width/29, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500),                    
            SizedBox(height: screenSize.height/130),
            TextWidget(text: update, color: isDarkMode ? Colors.white70 : Colors.black87, size: screenSize.width/29, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w500),                    
          ],
        ),
      ),
    );
  }
}
