import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/current_date_widget/current_date_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/milk_stock_widget/milk_stock_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MilkStockCountWidget extends StatelessWidget {
  const MilkStockCountWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CurrentDateWidget(formattedDate: formattedDate, isDarkMode: isDarkMode, screenSize: screenSize),        
        MilkStockWidget(isDarkMode: isDarkMode, screenSize: screenSize),
        
      ],
    );
  }
}