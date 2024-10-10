import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/available_stock_count_widget/available_stock_count_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/product_image_widget/product_image_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/product_price_widget/product_price_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/product_title_widget/product_title_widget.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.stockName
  });
  final Size screenSize;
  final bool isDarkMode;
  final String imageUrl;
  final String title;
  final String price;
  final String stockName;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
          width: .2,
        ),
        borderRadius: BorderRadius.circular(screenSize.width/75), 
      ),
      elevation: 3,
      color: isDarkMode ? Colors.black: Colors.white,
      child: Container(
        width: screenSize.width / 2.3,
        padding: EdgeInsets.all(screenSize.width / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageWidget(imageUrl: imageUrl, screenSize: screenSize),
            ProductTitleWidget(screenSize: screenSize, title: title, isDarkMode: isDarkMode),
            AvailableStockCountWidget(stockName: stockName,screenSize: screenSize,),
            ProductPriceWidget(screenSize: screenSize, price: price),
          ],
        ),
      ),
    );
  }
}