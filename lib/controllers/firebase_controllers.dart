import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuthService firebaseAuthServiceInstance = FirebaseAuthService();

class FirebaseAuthService {

  FirebaseAuth auth = FirebaseAuth.instance;

  // firebase login function 
  Future<User?> userLogin({required String email,required String password,required context}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      return snackbarMessageWidget(text: 'User Not Found. Create Account', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 2000);
    }
  }

  // firebase signup function
  Future<User?> userSignup({required String email,required String password,required context}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      return snackbarMessageWidget(text: 'Already a User. Please Login', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 2000);
    }
  }

}