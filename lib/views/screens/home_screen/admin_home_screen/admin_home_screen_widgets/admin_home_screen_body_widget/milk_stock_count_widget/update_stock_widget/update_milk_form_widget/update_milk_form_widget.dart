// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

TextEditingController stockUpdateController = TextEditingController(); 

Future<dynamic> addMilkStockForm(
    {required BuildContext context,
    required bool isDarkMode,
    required Size screenSize,
    required bool isReduceStock,
    }) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {

      return AlertDialog(       
        title: TextWidget(
            text: (isReduceStock==true)?'Reduce Milk From Stock': 'Add Milk To Stock',
            color: isDarkMode ? Colors.white : Colors.black,
            size: screenSize.width / 18,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w600),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        content: TextField(
          controller: stockUpdateController,
          decoration: InputDecoration(
            hintText: 'Enter new stock value',
            hintStyle: TextStyle(
              color: isDarkMode ? Colors.white54 : Colors.grey,
            ),
            border: const OutlineInputBorder(),
          ),
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          keyboardType: TextInputType.number,          
        ),
        actions: [
          TextButton(
            onPressed: () {
              stockUpdateController.clear();
              Navigator.of(context).pop();
            },
            
            child: TextWidget(text: 'Cancel', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width/25, fontFamily: 'FarmDairyFontBold', weight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              if (stockUpdateController.text.isNotEmpty) {
              num stock = double.parse(stockUpdateController.text.trim());  
              addAndUpdateMilkStock(newStockValue: stock,isReduceStock: isReduceStock);
              stockUpdateController.clear();
              Navigator.of(context).pop();
              }
            },
            child: TextWidget(text: 'Submit', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width/25, fontFamily: 'FarmDairyFontBold', weight: FontWeight.bold),
          ),
        ],
      );
    },
  );
}
