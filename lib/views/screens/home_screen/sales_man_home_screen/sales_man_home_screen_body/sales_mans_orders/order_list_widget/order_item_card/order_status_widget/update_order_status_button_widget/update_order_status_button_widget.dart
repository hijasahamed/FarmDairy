import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UpdateOrderStatusButtonWidget extends StatelessWidget {
  const UpdateOrderStatusButtonWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      },
      child: TextWidget(
        text: 'Update Status',
        color: isDarkMode ? Colors.white54 : Colors.black54,
        size: screenSize.width / 35,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}