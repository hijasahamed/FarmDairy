import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retialer_home_screen_body_widget/available_products_widget/product_holder_card/product_card/available_stock_count_widget/available_stock_count_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/add_item_count/add_item_count.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/items_available_stock/items_available_stock.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/items_image/items_image.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/items_title/items_title.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_body_widget/purchase_body_items/place_order_text/place_order_text.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class PurchaseBodyItems extends StatelessWidget {
  const PurchaseBodyItems({
    super.key,
    required this.widget,
    required this.isDarkMode,
    required this.stockValue,
  });

  final RetailerPurchaseScreen widget;
  final bool isDarkMode;
  final int stockValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemsImage(widget: widget, isDarkMode: isDarkMode),
        ItemsTitle(widget: widget, isDarkMode: isDarkMode),
        ItemsAvailableStock(widget: widget),
        AvailableStockCountWidget(stockName: widget.stockName,screenSize: widget.screenSize,),        
        PlaceOrderText(widget: widget),
        AddItemCount(isDarkMode: isDarkMode, widget: widget,stockValue: stockValue,),
        // AddVillage(isDarkMode: isDarkMode, widget: widget),
      ],
    );
  }
}