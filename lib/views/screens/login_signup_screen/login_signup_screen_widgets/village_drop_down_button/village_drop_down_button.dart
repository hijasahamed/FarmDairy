import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class VillageDropDownButton extends StatelessWidget {
  const VillageDropDownButton({
    super.key,
    required this.screenSize,
    required this.isDarkMode
    });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenSize.width/90),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        padding: EdgeInsets.all(screenSize.width/20),
        dropdownColor: isDarkMode? Colors.white:Colors.black,
        elevation: 5,
        isDense: true,
        iconEnabledColor: const Color(0xFFFD7014),
        value: villageSelectedDropDownItem,
        items: villageDropDownItems.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: TextWidget(text: item, color: isDarkMode? Colors.black:Colors.white, size: screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
          );
        }).toList(),
        onChanged: (value) {
          villageController.text = value.toString();
        },
      ),
    );
  }
}