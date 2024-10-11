import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    super.key,
    required this.screenSize,
    required this.price,
  });

  final Size screenSize;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenSize.height / 150),
        TextWidget(
          text: price, 
          color: Colors.green, 
          size: screenSize.width / 25, 
          fontFamily: 'FarmDairyFontNormal', 
          weight: FontWeight.bold
        ),
      ],
    );
  }
}