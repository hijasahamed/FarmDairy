import 'package:flutter/material.dart';

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

void loginButtonClicked(){
  if(userLoginformkey.currentState!.validate()){
    print('loged in');
  }
  else{
    print('NOt logged in');
  }
}