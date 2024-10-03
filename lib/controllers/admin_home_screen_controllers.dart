import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

// Function to add and reduce the stock of milk stored
Future<void> addAndUpdateMilkStock({required num newStockValue,required bool isReduceStock}) async {
  try {
    DocumentReference stockRef = FirebaseFirestore.instance
        .collection('milkStock')
        .doc('availableMilkStock');


    DocumentSnapshot snapshot = await stockRef.get();
    
    if (snapshot.exists) {

      num currentStock = snapshot['stock'];     
      num updatedStock = (isReduceStock==true)?currentStock - newStockValue:currentStock + newStockValue;
      await stockRef.update({'stock': updatedStock});

    } else {
      return;
    }
  } catch (e) {
    log(e.toString());
  }
}


// Function to update products stocks
Future<void> updateProductsStockCount({
  required bool isMilkPeda,
  required bool isReduceStock,
  required int newStock,
}) async {
  try {
    String documentId = isMilkPeda ? 'milkPedaStock' : 'lassiStock';

    DocumentReference stockDoc = FirebaseFirestore.instance
        .collection('productStocks')
        .doc(documentId);

    DocumentSnapshot docSnapshot = await stockDoc.get();

    if (docSnapshot.exists) {

      String currentStockStr = docSnapshot.get('stock') as String;

      int currentStock = int.tryParse(currentStockStr) ?? 0;

      int updatedStock = (isReduceStock==false)?currentStock + newStock:currentStock - newStock;

      String updatedStockStr = updatedStock.toString();

      await stockDoc.update({
        'stock': updatedStockStr,
      });

    } else {
      return;
    }
  } catch (e) {
    log(e.toString());
  }
}
