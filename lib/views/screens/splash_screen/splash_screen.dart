import 'package:farm_dairy/controllers/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    checkLogging(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {        
    return Scaffold(
      backgroundColor: widget.isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      body: Center(
        child: SvgPicture.asset(widget.isDarkMode?'assets/images/Logo_dark_theme.svg':'assets/images/Logo_light_theme.svg'),
      ),
    );
  }
}