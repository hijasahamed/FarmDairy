import 'package:flutter/material.dart';

class RetailerViewOrderScreen extends StatelessWidget {
  const RetailerViewOrderScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode?Colors.black:Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back_ios_new_rounded,color: isDarkMode?Colors.white:Colors.black,)
        ),
      ),
    );
  }
}