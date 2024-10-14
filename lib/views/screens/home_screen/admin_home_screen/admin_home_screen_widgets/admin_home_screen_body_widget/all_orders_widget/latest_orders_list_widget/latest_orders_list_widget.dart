import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/all_orders_widget/latest_orders_list_widget/latest_orders_holder_widget/latest_orders_holder_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/all_orders_widget/latest_orders_list_widget/view_all_orders_button/view_all_orders_button.dart';
import 'package:flutter/material.dart';


class LatestOrdersListWidget extends StatelessWidget {
  const LatestOrdersListWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenSize.width / 75),
      decoration: BoxDecoration(
        border: Border.all(width: .1, color: isDarkMode ? Colors.white : Colors.black),
        borderRadius: BorderRadius.circular(screenSize.width/75)
      ),
      width: screenSize.width,
      child: Column(
        children: [
          LatestOrdersHolderWidget(screenSize: screenSize, isDarkMode: isDarkMode),
          ViewAllOrdersButton(isDarkMode: isDarkMode, screenSize: screenSize)
        ],
      ),
    );
  }
}