import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class ItemsAvailableStock extends StatelessWidget {
  const ItemsAvailableStock({
    super.key,
    required this.widget,
  });

  final RetailerPurchaseScreen widget;

  @override
  Widget build(BuildContext context) {
    return TextWidget(text: '${widget.price} / Pcs', color: Colors.green, size: widget.screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold);
  }
}