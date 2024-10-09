import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_app_bar/purchase_app_bar.dart';
import 'package:flutter/material.dart';

class RetailerPurchaseScreen extends StatelessWidget {
  const RetailerPurchaseScreen({
    super.key,
    required this.screenSize,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.stockName
    });
  final Size screenSize;
  final String imageUrl;
  final String title;
  final String price;
  final String stockName;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: PurchaseAppBar(isDarkMode: isDarkMode, screenSize: screenSize),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width/50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(screenSize.width/50),
                height: screenSize.height/3,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(screenSize.width/75),
                  border: Border.all(color: isDarkMode?const Color.fromARGB(255, 184, 184, 184):const Color.fromARGB(255, 39, 39, 39),width: .1)
                ),
                child: Image.asset(imageUrl),
              ),
              TextWidget(text: title, color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/10, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
              TextWidget(text: '$price / Pcs', color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
            ],
          ),
        )
      ),
    );
  }
}

