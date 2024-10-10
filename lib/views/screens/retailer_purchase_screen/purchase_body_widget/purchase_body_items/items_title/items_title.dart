import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class ItemsTitle extends StatelessWidget {
  const ItemsTitle({
    super.key,
    required this.widget,
    required this.isDarkMode,
  });

  final RetailerPurchaseScreen widget;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: widget.title, color: isDarkMode?Colors.white:Colors.blueGrey, size: widget.screenSize.width/10, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold);
  }
}