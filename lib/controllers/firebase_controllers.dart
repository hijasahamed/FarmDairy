import 'package:farm_dairy/models/common_widgets/snack_bar_message_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuthService auth = FirebaseAuthService();

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> userLogin({required String email,required String password,required context}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      return snackbarMessageWidget(text: 'Something Went Wrong', context: context, color: Colors.red, textColor: Colors.white, behavior: SnackBarBehavior.floating, time: 2000);
    }
  }
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