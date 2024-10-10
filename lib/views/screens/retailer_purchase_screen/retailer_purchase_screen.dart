import 'package:farm_dairy/controllers/retailer_purchase_screen_controllers.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_app_bar/purchase_app_bar.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_widget.dart';
import 'package:flutter/material.dart';

class RetailerPurchaseScreen extends StatefulWidget {
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
  State<RetailerPurchaseScreen> createState() => _RetailerPurchaseScreenState();
}

class _RetailerPurchaseScreenState extends State<RetailerPurchaseScreen> {

  int stockValue = 0;

   @override
  void initState() {
    super.initState();
    fetchStockValue();
  }

  Future<void> fetchStockValue() async {
    int value = await getStockValue(stockName: widget.stockName);
    setState(() {
      stockValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;    
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      appBar: PurchaseAppBar(isDarkMode: isDarkMode, screenSize: widget.screenSize),
      body: PurchaseBodyWidget(widget: widget, isDarkMode: isDarkMode,stockValue: stockValue,),
    );
  }
}

