// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/controllers/firebase_controllers.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
Future<bool> addSalesmanDetails({
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
      await firebaseAuthServiceInstance.userSignup(
        context: context,
        email: 'farmDairy$location@gmail.com',
        password: mobileNumber,
      );
      CollectionReference salesManCollection =
          FirebaseFirestore.instance.collection('salesManDetails');

      await salesManCollection.add({
        'salesmanName': salesmanName,
        'vehicleNumber': vehicleNumber,
        'location': location,
        'role': 'SalesMan',
        'mobileNumber': mobileNumber,
        'timestamp': FieldValue.serverTimestamp(),
      });
      snackbarMessageWidget(text: 'SalesMan Added', context: context, color: Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
      addSalesPersonRefreshInstance.add(AddSalesManStopRefreshEvent());
      return true;
    }
  } catch (e) {
    snackbarMessageWidget(text: 'Something Went Wrong', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000); 
    log(e.toString());
    return false;
  }
  return false;
}

// Function to update Salesman Details to firebase db
Future<void> updateSalesMan({
  required String documentId,
  required String salesmanName,
  required String vehicleNumber,
  required String location,
  required String mobileNumber,
  required BuildContext context,
  required GlobalKey<FormState> formkey,
}) async {
  try {
    if (formkey.currentState!.validate()) {
      CollectionReference salesManCollection = 
          FirebaseFirestore.instance.collection('salesManDetails');
      await salesManCollection.doc(documentId).update({
        'salesmanName': salesmanName,
        'vehicleNumber': vehicleNumber,
        'location': location,
        'mobileNumber': mobileNumber,
      });
      snackbarMessageWidget(text: 'SalesMan Updated', context: context, color: Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
    }
  } catch (e) {
    snackbarMessageWidget(text: 'Something Went Wrong', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000); 
    log(e.toString());
  }
}

//Function to delete the salesMan from db
Future<bool> deleteSalesMan({
  required String documentId,
  required BuildContext context,
}) async {
  try {

    CollectionReference salesManCollection = FirebaseFirestore.instance.collection('salesManDetails');

    await salesManCollection.doc(documentId).delete();

    await FirebaseAuth.instance.currentUser!.delete();

    snackbarMessageWidget(
      text: 'SalesMan Deleted Successfully',
      context: context,
      color: Colors.green,
      textColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      time: 3000,
    );
    return true;
  } catch (e) {
    log('Error deleting SalesMan: $e');
    snackbarMessageWidget(
      text: 'Failed to delete SalesMan',
      context: context,
      color: Colors.red,
      textColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      time: 3000,
    );
    return false;
  }
}

// Function to delete Orders Placed by the retailers
void deleteRetailersOrder({required BuildContext context,required bool isDarkMode,required Size screenSize,required String documentId}) async {
  try {
    await FirebaseFirestore.instance
        .collection('productOrders')
        .doc(documentId)
        .delete();
    await FirebaseAuth.instance.currentUser!.delete();
    snackbarMessageWidget(text: 'Order deleted successfully.', context: context, color: Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);    
    Navigator.of(context).pop();
  } catch (e) {
    snackbarMessageWidget(text: 'Failed to delete the order', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000); 
  }
}

// Function to delete the retailer by the admin
Future<void> deleteRetailer({required String docId,required BuildContext context}) async {
  try {
    await FirebaseFirestore.instance
        .collection('userSignupData')
        .doc(docId)
        .delete();
    await FirebaseAuth.instance.currentUser!.delete();
    snackbarMessageWidget(text: 'Retailer deleted successfully', context: context, color:Colors.green, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
  } catch (e) {
    snackbarMessageWidget(text: 'Failed to delete', context: context, color:Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
  }
}