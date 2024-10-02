import 'package:farm_dairy/models/firebase_options/firebase_options.dart';
import 'package:farm_dairy/views/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode?Colors.black:Colors.white,
      statusBarIconBrightness: isDarkMode?Brightness.light:Brightness.dark,
      statusBarBrightness: isDarkMode?Brightness.light:Brightness.dark,
      systemNavigationBarColor: isDarkMode?Colors.black:Colors.white,
      systemNavigationBarDividerColor: isDarkMode?Colors.black:Colors.white,
      systemNavigationBarIconBrightness: isDarkMode?Brightness.light:Brightness.dark,
    ));    
    final screenSize =MediaQuery.of(context).size;
    return MaterialApp(
      title: 'FarmDairy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,        
      ),
      home: SplashScreen(screenSize: screenSize,isDarkMode: isDarkMode,),
    );
  }
}