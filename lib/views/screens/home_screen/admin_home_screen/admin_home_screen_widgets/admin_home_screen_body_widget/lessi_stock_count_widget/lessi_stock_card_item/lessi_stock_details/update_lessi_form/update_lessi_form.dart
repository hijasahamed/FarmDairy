import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

TextEditingController productStockUpdateController = TextEditingController(); 

Future<dynamic> addProductStockForm(
    {required BuildContext context,
    required bool isDarkMode,
    required  screenSize,
    required bool isReduceStock,
    required bool? isMilkPeda
    }) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {

      return AlertDialog(       
        title: TextWidget(
            text: (isReduceStock==true)?'Reduce Stock': 'Add Stock',
            color: isDarkMode ? Colors.white : Colors.black,
            size: screenSize.width / 18,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w600),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        content: TextField(
          controller: productStockUpdateController,
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
              productStockUpdateController.clear();
              Navigator.of(context).pop();
            },            
            child: TextWidget(text: 'Cancel', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width/25, fontFamily: 'FarmDairyFontBold', weight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              if (productStockUpdateController.text.isNotEmpty) {
              int newStock = int.parse(productStockUpdateController.text);
              updateProductsStockCount(isMilkPeda: isMilkPeda!, newStock: newStock,isReduceStock: isReduceStock);
              productStockUpdateController.clear();
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