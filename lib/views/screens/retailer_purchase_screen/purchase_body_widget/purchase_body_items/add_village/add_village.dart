import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class AddVillage extends StatelessWidget {
  const AddVillage({
    super.key,
    required this.isDarkMode,
    required this.widget,
  });

  final bool isDarkMode;
  final RetailerPurchaseScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Village',
          color: isDarkMode ? Colors.white : Colors.black,
          size: widget.screenSize.width / 30,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w400,
        ),
        TextFormField(
          controller: villageController,
          keyboardType: TextInputType.none,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black), 
          decoration: InputDecoration(
            filled: true,
            fillColor: isDarkMode ? Colors.grey[900]! : const Color.fromARGB(255, 235, 235, 235),
            hintText: 'Enter village name',
            hintStyle: TextStyle(color: isDarkMode ? Colors.grey[500]! : Colors.grey[700]!,fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.screenSize.width / 75),
              borderSide: BorderSide(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: widget.screenSize.width/90),
              child: DropdownButton<String>(
                underline: const SizedBox.shrink(),
                padding: EdgeInsets.all(widget.screenSize.width/20),
                dropdownColor: isDarkMode? Colors.white:Colors.black,
                elevation: 5,
                isDense: true,
                iconEnabledColor: const Color(0xFFFD7014),
                value: villageSelectedDropDownItem,
                items: villageDropDownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: item,
                    child: TextWidget(text: item, color: isDarkMode? Colors.black:Colors.white, size: widget.screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
                  );
                }).toList(),
                onChanged: (value) {
                  villageController.text = value.toString();
                },
              ),
            )
          ),
        ),
        SizedBox(height: widget.screenSize.width / 50),
      ],
    );
  }
}