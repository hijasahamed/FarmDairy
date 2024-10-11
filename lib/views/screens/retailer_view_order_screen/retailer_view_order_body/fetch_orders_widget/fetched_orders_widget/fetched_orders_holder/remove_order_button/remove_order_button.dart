import 'package:flutter/material.dart';

class RemoveOrderButton extends StatelessWidget {
  const RemoveOrderButton({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.documentId
  });

  final Size screenSize;
  final bool isDarkMode;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
      }, 
      icon: Icon(Icons.delete,size: screenSize.width/21,color: isDarkMode?Colors.white:Colors.black,)
    );
  }
}