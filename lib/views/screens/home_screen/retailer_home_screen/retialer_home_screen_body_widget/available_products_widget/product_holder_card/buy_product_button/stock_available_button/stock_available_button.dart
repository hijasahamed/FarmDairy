import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class StockAvailableButton extends StatelessWidget {
  const StockAvailableButton({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.stockName,
    required this.email
  });

  final Size screenSize;
  final bool isDarkMode;
  final String imageUrl;
  final String title;
  final String price;
  final String stockName;
  final String email;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RetailerPurchaseScreen(screenSize: screenSize,imageUrl: imageUrl,price: price,stockName: stockName,title: title,email: email,);
        },));
      }, 
      child: TextWidget(
        text: 'Buy Product', 
        color: Colors.blue, 
        size: screenSize.width/25, 
        fontFamily: 'FarmDairyFontNormal', 
        weight: FontWeight.w200
      )
    );
  }
}