import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_count_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/milk_stock_count_widget.dart';
import 'package:flutter/material.dart';

class AdminHomeScreenBodyWidget extends StatelessWidget {
  const AdminHomeScreenBodyWidget(
      {super.key, required this.screenSize, required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width / 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilkStockCountWidget(isDarkMode: isDarkMode, screenSize: screenSize),
          LessiStockCountWidget(screenSize: screenSize, isDarkMode: isDarkMode)
        ],
      ),
    );
  }
}
