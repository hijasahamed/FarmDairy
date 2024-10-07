// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:flutter/material.dart';

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

// Function to add Salesman Details to firebase db
Future<void> addSalesmanDetails({
  required String salesmanName,
  required String vehicleNumber,
  required String location,
  required String mobileNumber,
  required BuildContext context,
  required GlobalKey<FormState> formkey,
}) async {
  try {
    if(formkey.currentState!.validate()){
      addSalesPersonRefreshInstance.add(AddSalesManRefreshEvent());
      CollectionReference salesManCollection =
          FirebaseFirestore.instance.collection('salesManDetails');

      await salesManCollection.add({
        'salesmanName': salesmanName,
        'vehicleNumber': vehicleNumber,
        'location': location,
        'mobileNumber': mobileNumber,
        'timestamp': FieldValue.serverTimestamp(),
      });
      snackbarMessageWidget(text: 'SalesMan Added', context: context, color: Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000); 
    }
  } catch (e) {
    snackbarMessageWidget(text: 'Something Went Wrong', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000); 
    log(e.toString());
  }
}
