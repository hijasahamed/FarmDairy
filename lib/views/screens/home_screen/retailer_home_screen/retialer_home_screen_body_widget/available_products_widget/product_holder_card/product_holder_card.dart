

import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/buy_product_button/buy_product_button.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/product_card.dart';
import 'package:flutter/material.dart';

Widget productCard({
    required String imageUrl,
    required String title,
    required String price,
    required Size screenSize,
    required bool isDarkMode,
    required String stockName,
    required String email
  }) {
    return Row(
      children: [
        ItemCard(imageUrl: imageUrl,isDarkMode: isDarkMode,price: price,screenSize: screenSize,title: title,stockName: stockName,),
        BuyProductButton(imageUrl: imageUrl,isDarkMode: isDarkMode,price: price,screenSize: screenSize,title: title,stockName: stockName,email: email,)
      ],
    );
}