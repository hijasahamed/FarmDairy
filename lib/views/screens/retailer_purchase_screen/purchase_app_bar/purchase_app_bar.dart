import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_app_bar/purchase_appbar_back_button/purchase_appbar_back_button.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/purchase_app_bar/purchase_appbar_title/purchase_appbar_title.dart';
import 'package:flutter/material.dart';

class PurchaseAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PurchaseAppBar({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      leading: PurchaseAppBackButtonWidget(screenSize: screenSize, isDarkMode: isDarkMode),
      title: PurchaseAppBarTitleWidget(isDarkMode: isDarkMode, screenSize: screenSize),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/11);
}



