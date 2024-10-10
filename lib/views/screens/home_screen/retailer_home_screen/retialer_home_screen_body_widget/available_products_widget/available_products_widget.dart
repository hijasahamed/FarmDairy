import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_holder_card.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/text_available_products_and_divider/text_available_products_and_divider.dart';
import 'package:flutter/material.dart';

class AvailableProductsWidget extends StatelessWidget {
  const AvailableProductsWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.email
  });

  final bool isDarkMode;
  final Size screenSize;
  final dynamic email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextAvailableProductsAndDivider(isDarkMode: isDarkMode, screenSize: screenSize),
        productCard(
          imageUrl: isDarkMode?'assets/images/lessi black background.png':'assets/images/lessi.jpg',
          title: 'Lassi',
          price: '₹30',
          screenSize: screenSize,
          isDarkMode: isDarkMode,
          stockName: 'lassiStock',
          email: email
        ),
        productCard(
          imageUrl: isDarkMode? 'assets/images/milk peda blk bg.png':'assets/images/milk peda.webp',
          title: 'Milk Peda',
          price: '₹100',
          screenSize: screenSize,
          isDarkMode: isDarkMode,
          stockName: 'milkPedaStock',
          email: email
        ),
      ],
    );
  }
}

