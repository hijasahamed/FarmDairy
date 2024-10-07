import 'package:flutter/material.dart';

class UpdateAddress extends StatelessWidget {
  const UpdateAddress({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
      }, 
      icon: Icon(
        Icons.edit,
        size: screenSize.width/25,
        color: isDarkMode?Colors.white:Colors.black,
      )
    );
  }
}