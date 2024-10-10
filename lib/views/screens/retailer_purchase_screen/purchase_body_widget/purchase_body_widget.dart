import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/purchase_body_items.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class PurchaseBodyWidget extends StatelessWidget {
  const PurchaseBodyWidget({
    super.key,
    required this.widget,
    required this.isDarkMode,
    required this.stockValue
  });

  final RetailerPurchaseScreen widget;
  final bool isDarkMode;
  final int stockValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(widget.screenSize.width/50),
          child: PurchaseBodyItems(widget: widget, isDarkMode: isDarkMode, stockValue: stockValue),
        ),
      )
    );
  }
}