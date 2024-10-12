import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AllOrdersWidget extends StatelessWidget {
  const AllOrdersWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/20,bottom: screenSize.width/75),
      child: Column(
        children: [
          TextWidget(text: 'All Orders', color: isDarkMode? Colors.white:Colors.black, size: screenSize.width/20, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold)
        ],
      ),
    );
  }
}