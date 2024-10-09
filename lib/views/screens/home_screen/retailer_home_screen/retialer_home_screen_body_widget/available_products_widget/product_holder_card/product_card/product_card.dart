import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/available_stock_count_widget/available_stock_count_widget.dart';
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
      elevation: 3,
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: Container(
        width: screenSize.width / 2.3,
        padding: EdgeInsets.all(screenSize.width / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: screenSize.width / 2.3,
              height: screenSize.height / 8,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenSize.height / 60),
            TextWidget(
              text: title, 
              color: isDarkMode ? Colors.white : Colors.black, 
              size: screenSize.width / 25, 
              fontFamily: 'FarmDairyFontNormal', 
              weight: FontWeight.bold
            ),
            AvailableStockCountWidget(stockName: stockName,screenSize: screenSize,),
            SizedBox(height: screenSize.height / 80),
            TextWidget(
              text: price, 
              color: Colors.green, 
              size: screenSize.width / 25, 
              fontFamily: 'FarmDairyFontNormal', 
              weight: FontWeight.bold
            ),
          ],
        ),
      ),
    );
  }
}