import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
    required this.update,
    required this.screenSize,
    required this.isDarkMode,
  });

  final String update;
  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: update,
          color: (update == 'Order Placed')
              ? Colors.lightBlue
              : (update == 'Deliverd')
                  ? Colors.green
                  : Colors.redAccent,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: TextWidget(
            text: 'Update Status',
            color: isDarkMode ? Colors.white54 : Colors.black54,
            size: screenSize.width / 35,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}