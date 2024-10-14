import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_app_bar/app_bar_back_button/app_bar_back_button.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_app_bar/app_bar_title_widget/app_bar_title_widget.dart';
import 'package:flutter/material.dart';

class RetailerViewOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RetailerViewOrderAppBar({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.title
  });

  final bool isDarkMode;
  final Size screenSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      leading: AppBarBackButton(isDarkMode: isDarkMode),
      title: AppBarTitleWidget(isDarkMode: isDarkMode, screenSize: screenSize,title: title,),
    );
  }
   @override
  Size get preferredSize => Size.fromHeight(screenSize.height/11);
}



