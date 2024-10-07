import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/salesman_add_button.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/salesman_details_holder.dart';
import 'package:flutter/material.dart';

class DriverDetailsHolder extends StatelessWidget {
  const DriverDetailsHolder({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenSize.width / 75),
      decoration: BoxDecoration(border: Border.all(width: .1, color: isDarkMode ? Colors.white : Colors.black)),
      width: screenSize.width,
      child: Column(
        children: [
          SalesManAddButton(isDarkMode: isDarkMode, screenSize: screenSize),
          SalesManDetailsHolder(isDarkMode: isDarkMode, screenSize: screenSize),
        ],
      ),
    );
  }
}



