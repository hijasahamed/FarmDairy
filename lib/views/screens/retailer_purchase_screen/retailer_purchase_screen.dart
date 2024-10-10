import 'package:farm_dairy/controllers/retailer_purchase_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/available_stock_count_widget/available_stock_count_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_app_bar/purchase_app_bar.dart';
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

  String stockValue = '0';

   @override
  void initState() {
    super.initState();
    fetchStockValue();
  }

  Future<void> fetchStockValue() async {
    String value = await getStockValue(stockName: widget.stockName);
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
      body: PurchaseBodyWidget(widget: widget, isDarkMode: isDarkMode),
    );
  }
}

class PurchaseBodyWidget extends StatelessWidget {
  const PurchaseBodyWidget({
    super.key,
    required this.widget,
    required this.isDarkMode,
  });

  final RetailerPurchaseScreen widget;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(widget.screenSize.width/50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(widget.screenSize.width/150),
              height: widget.screenSize.height/3,
              width: widget.screenSize.width,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(widget.screenSize.width/75),
                border: Border.all(color: isDarkMode?const Color.fromARGB(255, 184, 184, 184):const Color.fromARGB(255, 39, 39, 39),width: .1)
              ),
              child: Image.asset(widget.imageUrl),
            ),
            TextWidget(text: widget.title, color: isDarkMode?Colors.white:Colors.blueGrey, size: widget.screenSize.width/10, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
            TextWidget(text: '${widget.price} / Pcs', color: Colors.green, size: widget.screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
            AvailableStockCountWidget(stockName: widget.stockName,screenSize: widget.screenSize,),
            SizedBox(height: widget.screenSize.height/80,),
            TextWidget(text: 'Place Your Order', color: Colors.blueGrey, size: widget.screenSize.width/15, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
          ],
        ),
      )
    );
  }
}