import 'package:flutter/material.dart';

class UsersRoleScreen extends StatelessWidget {
  const UsersRoleScreen({super.key, required this.screenSize,required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode?Colors.black:const Color.fromARGB(255, 228, 242, 245),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(screenSize.width / 50),
        child: Column(
          children: [
            Container(
              height: screenSize.height / 4.5,
              width: screenSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenSize.width / 75),
                  color: const Color(0xFFFD7014)),
            ),
          ],
        ),
      )),
    );
  }
}
