// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/controllers/firebase_controllers.dart';
import 'package:farm_dairy/controllers/google_map_controllers.dart';
import 'package:farm_dairy/controllers/splash_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:farm_dairy/models/user_model/user_model.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

LoginSignupScreenBloc showSignupFunctionBlocInstance = LoginSignupScreenBloc();

LoginSignupScreenBloc fetchedLocationRefreshBlocInstance = LoginSignupScreenBloc();

LoginSignupScreenBloc showAddVillageFormBlocInstance = LoginSignupScreenBloc();

LoginSignupScreenBloc signUpAndLoginCircularBlocInstance = LoginSignupScreenBloc();

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

TextEditingController roleController = TextEditingController();

final GlobalKey<FormState> userLoginformkey = GlobalKey<FormState>();

String? selectedDropDownItem;

final List<String> dropDownItems = [
  'Admin',
  'SalesMan',
  'Retailer',
];

TextEditingController villageController = TextEditingController();

String? villageSelectedDropDownItem;

final List<String> villageDropDownItems = [
  'Pulikkal',
  'Ayikkarapadi',
  'Kottapuram',
];


// function when user click on the Login button
void loginButtonClicked({required BuildContext context,required Size screenSize})async{
  if(userLoginformkey.currentState!.validate()){
    signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorEvent());
    User? user = await firebaseAuthServiceInstance.userLogin(context: context,email: emailController.text,password: passwordController.text);
    if(user!=null){
      if(roleController.text == 'SalesMan'){
        dynamic salesManData = await checkIfSalesManAvailable(mobileNumber: passwordController.text);
        if(salesManData != null){
          final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
          await sharedPreferenceStorageInstance.setBool(logedInKey, true);
          await sharedPreferenceStorageInstance.setString('email', 'NoData');
          await sharedPreferenceStorageInstance.setString('password', salesManData.mobileNumber);
          await sharedPreferenceStorageInstance.setString('role', salesManData.role);
          await sharedPreferenceStorageInstance.setString('userUid', 'NoData');
          await sharedPreferenceStorageInstance.setString('village', salesManData.location);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SalesManHomeScreen(screenSize: screenSize,salesmanData: salesManData,)),
            (Route<dynamic> route) => false,
          );          
        }
      }else{
        dynamic userData = await checkIfUserAvailable(email: user.email!);
        if(userData != null){
          final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
          await sharedPreferenceStorageInstance.setBool(logedInKey, true);
          await sharedPreferenceStorageInstance.setString('email', userData.email);
          await sharedPreferenceStorageInstance.setString('password', userData.password);
          await sharedPreferenceStorageInstance.setString('role', userData.role);
          await sharedPreferenceStorageInstance.setString('userUid', userData.userUid);
          await sharedPreferenceStorageInstance.setString('village', userData.village);
          if(userData.role == 'Admin' && roleController.text == userData.role){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AdminHomescreen(screenSize: screenSize,)),
              (Route<dynamic> route) => false,
            );
          }else if(userData.role == 'Retailer' && roleController.text == userData.role){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => RetailerHomeScreen(screenSize: screenSize,email: userData.email,userData: userData,)),
              (Route<dynamic> route) => false,
            );
          }else{
            snackbarMessageWidget(text: 'UnRegisterd Role', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
          }          
        }
      }             
    }
    signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorStopEvent());
  }
  else{
    log('Not Logged In');
  }
}


// function when user click on the Signup button
void signUpButtonClicked({required BuildContext context,required Size screenSize}) async {
  if (userLoginformkey.currentState!.validate()) {
    if(draggedPosition != null){
      signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorEvent());
      try {
        if(roleController.text == 'SalesMan'){
          snackbarMessageWidget(
            text: 'SalesMan Account Cannot Be Created. Please Contact The Admin For Account Details', 
            context: context, 
            color: Colors.red, 
            textColor: Colors.white, 
            behavior: SnackBarBehavior.floating, 
            time: 3000
          );
          signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorStopEvent());
          return;
        }
        User? user = await firebaseAuthServiceInstance.userSignup(
          context: context,
          email: emailController.text,
          password: passwordController.text,
        );
        if(user!=null){
          await addUserSignupDataToFirebaseDbCollection(userUid: user.uid);
          dynamic userData = await checkIfUserAvailable(email: user.email.toString());
          final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
          await sharedPreferenceStorageInstance.setBool(logedInKey, true);
          await sharedPreferenceStorageInstance.setString('email', userData.email);
          await sharedPreferenceStorageInstance.setString('password', userData.password);
          await sharedPreferenceStorageInstance.setString('role', userData.role);
          await sharedPreferenceStorageInstance.setString('userUid', userData.userUid);
          await sharedPreferenceStorageInstance.setString('village', userData.village);
          if(userData.role == 'Admin'){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AdminHomescreen(screenSize: screenSize,)),
              (Route<dynamic> route) => false,
            );
          }else if(userData.role == 'SalesMan'){
            return;
          }else if(userData.role == 'Retailer'){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => RetailerHomeScreen(screenSize: screenSize,email: userData.email,userData: userData,)),
              (Route<dynamic> route) => false,
            );
          }
          signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorStopEvent());
        }

      } catch (e) {
        signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorStopEvent());
        log('SignUp Failed: $e');      
      }
    }else{
      
    snackbarMessageWidget(
        text: 'Add Location',
        context: context,
        time: 3000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      );
    }
  } else {
    signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorStopEvent());
    snackbarMessageWidget(
        text: 'Provide Correct Details',
        context: context,
        time: 3000,
        color: Colors.red,
        textColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      );
  }
}

// function to add the user details into firebase database of collection usersDetails
addUserSignupDataToFirebaseDbCollection({required userUid}) async {
  try {
    final CollectionReference instance = FirebaseFirestore.instance.collection('userSignupData');
    final data = {
      'email': emailController.text,
      'password': passwordController.text,
      'role': roleController.text,
      'userUid': userUid,
      'village' : villageController.text.isNotEmpty ? villageController.text : 'noData',
      'location': draggedPosition != null
      ? {
          'latitude': draggedPosition!.latitude,
          'longitude': draggedPosition!.longitude,
        }
      : 'noLocation',
    };
    await instance.add(data);
  } catch (e) {
    log(e.toString());
  }
}


// Function to check if the user is in db and get the details of that user
Future<UserData?> checkIfUserAvailable({required String email}) async {
  final CollectionReference instance = FirebaseFirestore.instance.collection('userSignupData');

  try {
    QuerySnapshot querySnapshot = await instance.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot doc = querySnapshot.docs.first;
      UserData userData = UserData(email: doc['email'], password: doc['password'], role: doc['role'], userUid: doc['userUid'],village: doc['village']);
      return userData;
    } else {
      return null;
    }
  } catch (e) {
    log('checkIfUserAvailable ${e.toString()}');
  }
  return null;
}


// Function to check if the Saleman is in db and get the details of that SalesMan
Future<SalesmanData?> checkIfSalesManAvailable({required String mobileNumber}) async {
  final CollectionReference instance = FirebaseFirestore.instance.collection('salesManDetails');

  try {
    QuerySnapshot querySnapshot = await instance.where('mobileNumber', isEqualTo: mobileNumber).get();

    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot doc = querySnapshot.docs.first;
      SalesmanData data =SalesmanData(location: doc['location'], mobileNumber: doc['mobileNumber'], role: doc['role'], salesManName: doc['salesmanName'], vehicleNumber: doc['vehicleNumber']);
      return data;
    } else {
      return null;
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}


// Function to Logout the Current user
Future<void> logout({required BuildContext context,required Size screenSize}) async {
  try {
    await FirebaseAuth.instance.signOut().then((value) async {
      final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
          await sharedPreferenceStorageInstance.setBool(logedInKey, false);
          await sharedPreferenceStorageInstance.setString('email', '');
          await sharedPreferenceStorageInstance.setString('password', '');
          await sharedPreferenceStorageInstance.setString('role', '');
          await sharedPreferenceStorageInstance.setString('userUid', '');
    },).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return LoginSignupScreen(screenSize: screenSize);
        },
      ),
      (Route<dynamic> route) => false,
    ); 
    },);  
  } catch (e) {
    snackbarMessageWidget(text: 'Something Went Wrong', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 3000);
  }
}