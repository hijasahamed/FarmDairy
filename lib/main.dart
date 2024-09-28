import 'package:farm_dairy/views/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      statusBarIconBrightness: isDarkMode?Brightness.light:Brightness.dark,
      statusBarBrightness: isDarkMode?Brightness.light:Brightness.dark,
      systemNavigationBarColor: isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      systemNavigationBarDividerColor: isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      systemNavigationBarContrastEnforced: false
    ));    
    final screenSize =MediaQuery.of(context).size;
    return MaterialApp(
      title: 'FarmDairy',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(screenSize: screenSize,isDarkMode: isDarkMode,),
    );
  }
}