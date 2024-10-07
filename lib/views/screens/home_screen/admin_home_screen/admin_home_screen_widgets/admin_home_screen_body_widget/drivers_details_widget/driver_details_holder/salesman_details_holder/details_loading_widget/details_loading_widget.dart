import 'package:flutter/material.dart';

class DetailsLoadingWidget extends StatelessWidget {
  const DetailsLoadingWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Colors.blue,strokeWidth: screenSize.width/250,),
    );
  }
}