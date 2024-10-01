import 'package:farm_dairy/controllers/splash_screen_controllers.dart';
import 'package:farm_dairy/views/screens/splash_screen/splash_screen_widgets/splash_screen_body_widget.dart';
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
    checkLogging(context: context,screenSize: widget.screenSize,);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {        
    return Scaffold(
      backgroundColor: widget.isDarkMode?Colors.black:Colors.white,
      body: SplashScreenBodyWidget(isDarkMode: widget.isDarkMode,screenSize: widget.screenSize,),
    );
  }
}