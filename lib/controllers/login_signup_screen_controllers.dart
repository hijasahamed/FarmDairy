// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/controllers/firebase_controllers.dart';
import 'package:farm_dairy/controllers/splash_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
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


// function when user click on the Login button
void loginButtonClicked({required BuildContext context,required Size screenSize})async{
  if(userLoginformkey.currentState!.validate()){
    User? user = await firebaseAuthServiceInstance.userLogin(context: context,email: emailController.text,password: passwordController.text);
    if(user!=null){
      signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorEvent());
        dynamic userData = await checkIfUserAvailable(email: user.email!);
        if(userData != null){
          final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
          await sharedPreferenceStorageInstance.setBool(logedInKey, true);
          await sharedPreferenceStorageInstance.setString('email', userData.email);
          await sharedPreferenceStorageInstance.setString('password', userData.password);
          await sharedPreferenceStorageInstance.setString('role', userData.role);
          await sharedPreferenceStorageInstance.setString('userUid', userData.userUid);
          if(userData.role == 'Admin'){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AdminHomescreen(screenSize: screenSize,)),
              (Route<dynamic> route) => false,
            );
          }else if(userData.role == 'SalesMan'){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SalesManHomeScreen()),
              (Route<dynamic> route) => false,
            );
          }else if(userData.role == 'Retailer'){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => RetailerHomeScreen(screenSize: screenSize,email: userData.email,)),
              (Route<dynamic> route) => false,
            );
          }
        }
      }
  }
  else{
    log('Not Logged In');
  }
}


// function when user click on the Signup button
void signUpButtonClicked({required BuildContext context,required Size screenSize}) async {
  if (userLoginformkey.currentState!.validate()) {
    signUpAndLoginCircularBlocInstance.add(SignUpAndLoginCircularIndicatorEvent());
    try {
      User? user = await firebaseAuthServiceInstance.userSignup(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
      if(user!=null){
        await addUserSignupDataToFirebaseDbCollection(userUid: user.uid);
        dynamic userData = await checkIfUserAvailable(email: user.email!);
        final sharedPreferenceStorageInstance = await SharedPreferences.getInstance();
        await sharedPreferenceStorageInstance.setBool(logedInKey, true);
        await sharedPreferenceStorageInstance.setString('email', userData.email);
        await sharedPreferenceStorageInstance.setString('password', userData.password);
        await sharedPreferenceStorageInstance.setString('role', userData.role);
        await sharedPreferenceStorageInstance.setString('userUid', userData.userUid);
        if(userData.role == 'Admin'){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => AdminHomescreen(screenSize: screenSize,)),
            (Route<dynamic> route) => false,
          );
        }else if(userData.role == 'SalesMan'){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SalesManHomeScreen()),
            (Route<dynamic> route) => false,
          );
        }else if(userData.role == 'Retailer'){
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RetailerHomeScreen(screenSize: screenSize,email: userData.email,)),
            (Route<dynamic> route) => false,
          );
        }
      }
    } catch (e) {
      log('SignUp Failed: $e');      
    }
  } else {
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
      'userUid': userUid
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
      UserData userData = UserData(email: doc['email'], password: doc['password'], role: doc['role'], userUid: doc['userUid']);
      return userData;
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