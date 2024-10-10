import 'package:cloud_firestore/cloud_firestore.dart';

// Function to fetch the stock count
Future<String> getStockValue({required String stockName}) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('productStocks')
        .doc(stockName)
        .get();

    if (snapshot.exists) {
      return snapshot.data()?['stock'] as String? ?? '0';
    } else {
      return '0';
    }
  } catch (e) {
    return '0';
  }
}