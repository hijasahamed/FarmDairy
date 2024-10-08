import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LogoutButtonMenu extends StatelessWidget {
  const LogoutButtonMenu({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMenu(
          color: Colors.white,
          context: context,
          position: const RelativeRect.fromLTRB(1000, 80, 0, 0),
          items: [
            PopupMenuItem<int>(
              value: 0,
              child: TextWidget(text: 'Log Out', color: Colors.red, size: screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w400),
            ),
          ],
          elevation: 8.0,
        ).then((value) {
          if (value == 0) {
            logout(context: context,screenSize: screenSize);
          }
        });
      }, 
      icon: Icon(Icons.more_vert,size: screenSize.width/15,color: isDarkMode?Colors.white:Colors.black,)
    );
  }
}