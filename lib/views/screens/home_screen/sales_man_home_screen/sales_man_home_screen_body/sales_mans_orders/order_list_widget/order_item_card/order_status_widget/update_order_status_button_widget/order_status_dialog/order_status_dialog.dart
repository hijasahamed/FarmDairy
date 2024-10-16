import 'package:farm_dairy/controllers/sales_man_home_screen.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

void showOrderStatusDialog({
  required BuildContext context,
  required String docId,
  required bool isDarkMode,
  required Size screenSize,
  required String title,
  required int pcs
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        title: TextWidget(
          text: 'Update Order Status',
          color: isDarkMode ? Colors.white : Colors.black,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: TextWidget(
                text: 'Order Packed',
                color:Colors.orange,
                size: screenSize.width / 25,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.bold,
              ),
              onTap: () {
                updateOrderStatus(docId: docId, status: 'Order Packed',title: title,pcs: pcs);
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: screenSize.height/50,),
            ListTile(
              title: TextWidget(
                text: 'Delivered',
                color: Colors.green,
                size: screenSize.width / 25,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.bold,
              ),
              onTap: () {
                updateOrderStatus(docId: docId, status: 'Delivered',title: title,pcs: pcs);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
