import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/update_stock_widget/add_stock_button/add_stock_button.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/update_stock_widget/reduce_stock_button/reduce_stock_button.dart';
import 'package:flutter/material.dart';

class UpdateMilkStock extends StatelessWidget {
  const UpdateMilkStock({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height / 50,bottom: screenSize.height / 50,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddStockButton(isDarkMode: isDarkMode, screenSize: screenSize),
          SizedBox(width: screenSize.width/20,),
          ReduceStockButton(isDarkMode: isDarkMode, screenSize: screenSize),
        ],
      ),
    );
  }
}