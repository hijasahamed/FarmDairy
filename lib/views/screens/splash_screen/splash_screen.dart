import 'package:farm_dairy/controllers/functions.dart';
import 'package:farm_dairy/views/widgets/splash_screen_widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,required this.screenSize,required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogging(context: context,screenSize: widget.screenSize,isDarkMode: widget.isDarkMode);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {        
    return Scaffold(
      backgroundColor: widget.isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      body: SplashScreenBodyWidget(isDarkMode: widget.isDarkMode),
    );
  }
}

