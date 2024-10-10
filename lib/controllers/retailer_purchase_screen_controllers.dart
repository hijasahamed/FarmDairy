import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

TextEditingController itemCountController = TextEditingController();
TextEditingController villageController = TextEditingController();

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