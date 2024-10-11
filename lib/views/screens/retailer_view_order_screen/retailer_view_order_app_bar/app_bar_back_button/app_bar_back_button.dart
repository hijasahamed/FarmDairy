import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      }, 
      icon: Icon(Icons.arrow_back_ios_new_rounded,color: isDarkMode?Colors.white:Colors.black,)
    );
  }
}