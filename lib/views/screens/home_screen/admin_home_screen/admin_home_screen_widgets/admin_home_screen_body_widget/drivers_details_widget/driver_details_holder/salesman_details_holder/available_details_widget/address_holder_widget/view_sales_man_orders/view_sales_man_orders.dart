import 'package:flutter/material.dart';

class ViewSalesManOrders extends StatelessWidget {
  const ViewSalesManOrders({
    super.key,
    required this.isDarkMode,
    required this.screenSize
    });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                
              }, 
              icon: Icon(Icons.arrow_back_ios_new_rounded)
            )
          ],
        )
      ),
    );
  }
}