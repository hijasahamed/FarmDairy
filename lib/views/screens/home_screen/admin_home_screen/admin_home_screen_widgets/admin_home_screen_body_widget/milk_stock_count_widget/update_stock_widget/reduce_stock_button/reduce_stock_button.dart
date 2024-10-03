import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/update_stock_widget/update_button_widget/update_button_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/update_stock_widget/update_milk_form_widget/update_milk_form_widget.dart';
import 'package:flutter/material.dart';

class ReduceStockButton extends StatelessWidget {
  const ReduceStockButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addMilkStockForm(context: context, isDarkMode: isDarkMode, screenSize: screenSize,isReduceStock: true);
      },
      child: UpdateButtonWidget(screenSize: screenSize, isDarkMode: isDarkMode,isReduceStock: true,),
    );
  }
}