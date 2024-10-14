import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/all_orders_widget/all_orders_text_widget/all_orders_text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/all_orders_widget/latest_orders_list_widget/latest_orders_list_widget.dart';
import 'package:flutter/material.dart';

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/20,bottom: screenSize.width/75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AllOrdersTextWidget(isDarkMode: isDarkMode, screenSize: screenSize),
          LatestOrdersListWidget(screenSize: screenSize, isDarkMode: isDarkMode)
        ],
      ),
    );
  }
}



