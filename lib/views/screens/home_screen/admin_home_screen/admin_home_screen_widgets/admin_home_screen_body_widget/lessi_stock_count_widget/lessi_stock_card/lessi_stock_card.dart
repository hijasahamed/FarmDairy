import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_card_item.dart';
import 'package:flutter/material.dart';

class LassiStockCard extends StatelessWidget {
  const LassiStockCard({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    this.isMilkPeda
  });

  final Size screenSize;
  final bool isDarkMode;
  final bool? isMilkPeda;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenSize.width / 40),
      height: screenSize.height / 5,
      width: screenSize.width,
      decoration: BoxDecoration(
        border: Border.all(width: .1),
        borderRadius: BorderRadius.circular(screenSize.width/50)
      ),
      child: LessiStockCardItems(screenSize: screenSize, isDarkMode: isDarkMode,isMilkPeda: isMilkPeda,)
    );
  }
}

