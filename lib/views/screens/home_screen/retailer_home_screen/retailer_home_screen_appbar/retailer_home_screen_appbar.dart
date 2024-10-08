import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_app_bar_widget/logout_button_menu/logout_button_menu.dart';
import 'package:farm_dairy/views/screens/home_screen/retailer_home_screen/retailer_home_screen_appbar/app_bar_image/app_bar_image.dart';
import 'package:flutter/material.dart';

class RetailerHomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget{
  const RetailerHomeScreenAppbar({super.key,required this.screenSize,required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      flexibleSpace: AppbarImage(isDarkMode: isDarkMode),
      actions: [
        LogoutButtonMenu(screenSize: screenSize, isDarkMode: isDarkMode)
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/11);
}

