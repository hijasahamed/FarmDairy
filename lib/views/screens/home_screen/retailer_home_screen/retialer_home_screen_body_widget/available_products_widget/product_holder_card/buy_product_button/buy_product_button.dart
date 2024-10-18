import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/buy_product_button/no_stock_button/no_stock_button.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/buy_product_button/stock_available_button/stock_available_button.dart';
import 'package:flutter/material.dart';

class BuyProductButton extends StatelessWidget {
  const BuyProductButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.stockName,
    required this.email,
    required this.userData
  });
  final Size screenSize;
  final bool isDarkMode;
  final String imageUrl;
  final String title;
  final String price;
  final String stockName;
  final String email;
  final dynamic userData;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productStocks')
          .doc(stockName)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox.shrink();
        }
        var stock = snapshot.data!['stock'];
        if(stock == '0'){
          return NoStockButton(screenSize: screenSize);
        }else{
          return StockAvailableButton(screenSize: screenSize,isDarkMode: isDarkMode,imageUrl: imageUrl,price: price,stockName: stockName,title: title,email: email,userData: userData,);
        }
      },
    );
  }
}