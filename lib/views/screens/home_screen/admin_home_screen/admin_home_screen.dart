import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_app_bar_widget/admin_home_screen_app_bar_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/admin_home_screen_body_widget.dart';
import 'package:flutter/material.dart';

class AdminHomescreen extends StatelessWidget {
  const AdminHomescreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AdminHomeScreenAppBarWidget(screenSize: screenSize,isDarkMode: isDarkMode,),
      body: AdminHomeScreenBodyWidget(screenSize: screenSize,isDarkMode: isDarkMode,)
    );
  }
}