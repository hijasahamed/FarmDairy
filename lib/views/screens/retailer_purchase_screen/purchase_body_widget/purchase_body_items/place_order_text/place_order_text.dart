import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class PlaceOrderText extends StatelessWidget {
  const PlaceOrderText({
    super.key,
    required this.widget,
  });

  final RetailerPurchaseScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.screenSize.height/80,),
        TextWidget(text: 'Place Your Order', color: Colors.blueGrey, size: widget.screenSize.width/15, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
        Divider(endIndent: widget.screenSize.width/2.3,),
        SizedBox(height: widget.screenSize.height/80,),
      ],
    );
  }
}