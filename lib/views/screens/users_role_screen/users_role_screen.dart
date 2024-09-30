import 'package:farm_dairy/controllers/users_role_screen_functions.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UsersRoleScreen extends StatelessWidget {
  const UsersRoleScreen({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDarkMode ? Colors.black : const Color.fromARGB(255, 228, 242, 245),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(screenSize.width / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: 'whats your role in FarmDairy',
                color: isDarkMode ? Colors.white : Colors.blueGrey,
                size: screenSize.width / 18,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.bold),
                Divider(color: Colors.blueGrey,thickness: screenSize.width/300,),
            SizedBox(height: screenSize.height/30,),
            Column(
              children: usersRoles.map((containerInfo) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: screenSize.height / 50),
                  height: screenSize.height / 5.5,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(screenSize.width / 75),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [                      
                      TextWidget(text: containerInfo['role']!, color: Colors.white, size: screenSize.width/15, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold)
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      )),
    );
  }
}
