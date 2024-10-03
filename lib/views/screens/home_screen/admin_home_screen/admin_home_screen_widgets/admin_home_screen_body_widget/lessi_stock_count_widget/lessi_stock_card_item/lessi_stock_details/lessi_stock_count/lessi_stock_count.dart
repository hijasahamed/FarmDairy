import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/lessi_stock_count/stock_count/stock_count.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/lessi_stock_count/text_available_pcs/text_available_pcs.dart';
import 'package:flutter/material.dart';

class LassiStockCount extends StatelessWidget {
  const LassiStockCount({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    this.isMilkPeda
  });

  final bool isDarkMode;
  final Size screenSize;
  final bool? isMilkPeda;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StockCount(isDarkMode: isDarkMode, screenSize: screenSize,isMilkPeda: isMilkPeda,),
        TextAvailablePcs(screenSize: screenSize),
      ],
    );
  }
}

