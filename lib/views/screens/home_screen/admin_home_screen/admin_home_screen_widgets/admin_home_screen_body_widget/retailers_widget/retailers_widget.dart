import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/retailers_widget/all_retailers_widget/all_retailers_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/retailers_widget/retailers_title_text_widget/retailers_title_text_widget.dart';
import 'package:flutter/material.dart';

class RetailersWidget extends StatelessWidget {
  const RetailersWidget({
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
          RetailersTitleTextWidget(isDarkMode: isDarkMode, screenSize: screenSize),
          AllRetailersWidget(screenSize: screenSize, isDarkMode: isDarkMode)
        ],
      ),
    );
  }
}