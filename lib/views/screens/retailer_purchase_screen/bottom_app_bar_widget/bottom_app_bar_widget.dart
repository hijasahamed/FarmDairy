import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/controllers/retailer_purchase_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    super.key,
    required this.isDarkMode,
    required this.widget,
    required this.stockValue,
    required this.email,
    required this.userData
  });

  final bool isDarkMode;
  final RetailerPurchaseScreen widget;
  final int stockValue;
  final String email;
  final dynamic userData;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: isDarkMode?Colors.black:Colors.white,
      child: InkWell(
        onTap: () {
          addProductOrder(itemCount: itemCountController.text, village: villageController.text, price: widget.price,stockValue: stockValue,context: context,email: email,title: widget.title,userData: userData);
        },
        child: Ink(
          height: widget.screenSize.height/15,
          width: widget.screenSize.width/1.5,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(widget.screenSize.width/75)
          ),
          child: Center(child: TextWidget(text: 'Confirm Order', color: Colors.white, size: widget.screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold)),
        ),
      )
    );
  }
}