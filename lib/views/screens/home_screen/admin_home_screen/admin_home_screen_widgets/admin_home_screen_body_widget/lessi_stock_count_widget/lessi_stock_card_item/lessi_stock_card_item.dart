import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_image/lessi_image.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/lessi_stock_details.dart';
import 'package:flutter/material.dart';

class LessiStockCardItems extends StatelessWidget {
  const LessiStockCardItems({
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
    return Row(
      children: [
        LessiImage(screenSize: screenSize,isMilkPeda: isMilkPeda,),       
        LessiStockDetails(isDarkMode: isDarkMode, screenSize: screenSize,isMilkPeda: isMilkPeda,)
      ],
    );
  }
}


