import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_screen.dart';
import 'package:flutter/material.dart';

class BottomAppTextButtonWidget extends StatelessWidget {
  const BottomAppTextButtonWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RetailerViewOrderScreen(screenSize: screenSize,);
        },));
      },
      style: TextButton.styleFrom(
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ), 
      child: TextWidget(
        text: 'View My Orders',
        color: isDarkMode?Colors.white:Colors.white,
        size: 16.0,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}