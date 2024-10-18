import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController itemCountController = TextEditingController();

// Function to fetch the stock count
Future<int> getStockValue({required String stockName}) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('productStocks')
        .doc(stockName)
        .get();

    if (snapshot.exists) {
      return int.tryParse(snapshot.data()?['stock'].toString() ?? '0') ?? 0;
    } else {
      return 0;
    }
  } catch (e) {
    return 0;
  }
}


// Function for marking product order to db
Future<void> addProductOrder({
  required String itemCount,
  required String village,
  required String price,
  required String title,
  required int stockValue,
  required context,
  required email,
  required dynamic userData
}) async {
  int parsedItemCount = int.parse(itemCount);
  String numericPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
  int parsedPrice = int.parse(numericPrice);
  if(parsedItemCount < stockValue){
    try {
    
      int totalAmount = parsedItemCount * parsedPrice;

      DateTime orderDate = DateTime.now();

      final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
       String? storedVillage = sharedPreferenceStorageInstance.getString('village') ?? 'village';


      Map<String, dynamic> orderData = {
        'itemCount': parsedItemCount,
        'totalAmount': totalAmount,
        'village': storedVillage,
        'orderDate': orderDate,
        'email' : email,
        'title' : title,
        'update' : 'Order Placed',
        'location' : userData.location
      };

      await FirebaseFirestore.instance.collection('productOrders').add(orderData);
      itemCountController.clear();
      await snackbarMessageWidget(text: 'Order Placed', context: context, color: Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
      Navigator.of(context).pop();
    } catch (e) {
      log(e.toString());
    }
  }else{
    snackbarMessageWidget(text: 'Stock Limit Exeeds', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
  }
}