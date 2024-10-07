import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/driver_details_holder.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/sales_team_text_widget/sales_team_text_widget.dart';
import 'package:flutter/material.dart';

class DriversDetailsWidget extends StatelessWidget {
  const DriversDetailsWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SalesTeamTextWidget(screenSize: screenSize,isDarkMode: isDarkMode,),
        DriverDetailsHolder(screenSize: screenSize, isDarkMode: isDarkMode)
      ],
    );
  }
}