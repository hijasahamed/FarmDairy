import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateOrderStatus(
    {required String docId, required String status,required String title,required int pcs}) async {
  try {
    await FirebaseFirestore.instance
        .collection('productOrders')
        .doc(docId)
        .update({'update': status});

    if(status == 'Order Packed'){
      await updateProductStock(title: title, pcs: pcs);
    }
    
  } catch (e) {
    log(e.toString());
  }
}


Future<void> updateProductStock({
  required String title,
  required int pcs,
}) async {
  String collectionName;
  
  // Determine which collection to fetch from based on the title
  if (title == 'Lassi') {
    collectionName = 'lassiStock';
  } else if (title == 'Milk Peda') {
    collectionName = 'milkPedaStock';
  } else {
    log('Invalid product title');
    return;
  }

  try {
    // Fetch the current stock from the respective document
    DocumentSnapshot stockDoc = await FirebaseFirestore.instance
        .collection('productStocks')
        .doc(collectionName)
        .get();

    if (stockDoc.exists) {
      // Get the stock value and convert it to an integer
      String stockValueString = stockDoc['stock'];
      int stockValue = int.tryParse(stockValueString) ?? 0;

      // Subtract pcs from stock
      int updatedStock = stockValue - pcs;

      // Update the stock in the database
      await FirebaseFirestore.instance
          .collection('productStocks')
          .doc(collectionName)
          .update({'stock': updatedStock.toString()});

      log('Stock updated successfully');
    } else {
      log('Stock document does not exist');
    }
  } catch (e) {
    log('Failed to update stock: $e');
  }
}