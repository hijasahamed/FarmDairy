import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card/lessi_stock_card.dart';
import 'package:flutter/material.dart';

class LessiStockCountWidget extends StatelessWidget {
  const LessiStockCountWidget({
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
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/20,bottom: screenSize.width/20),
      child: LassiStockCard(screenSize: screenSize, isDarkMode: isDarkMode,isMilkPeda: isMilkPeda,),
    );
  }
}

