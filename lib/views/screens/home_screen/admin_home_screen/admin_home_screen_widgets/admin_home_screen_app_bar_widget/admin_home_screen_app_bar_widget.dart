import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_app_bar_widget/logout_button_menu/logout_button_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminHomeScreenAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AdminHomeScreenAppBarWidget({super.key,required this.screenSize,required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      flexibleSpace: SafeArea(
        child: SvgPicture.asset(isDarkMode?'assets/images/Logo_dark_theme.svg': 'assets/images/Logo_light_theme.svg',),
      ),
      actions: [
        LogoutButtonMenu(screenSize: screenSize, isDarkMode: isDarkMode)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/11);
}



