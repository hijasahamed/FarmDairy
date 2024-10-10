import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class ItemsImage extends StatelessWidget {
  const ItemsImage({
    super.key,
    required this.widget,
    required this.isDarkMode,
  });

  final RetailerPurchaseScreen widget;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.screenSize.width/150),
      height: widget.screenSize.height/3,
      width: widget.screenSize.width,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(widget.screenSize.width/75),
        border: Border.all(color: isDarkMode?const Color.fromARGB(255, 184, 184, 184):const Color.fromARGB(255, 39, 39, 39),width: .1)
      ),
      child: Image.asset(widget.imageUrl),
    );
  }
}