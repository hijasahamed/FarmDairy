import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ShowDirectionWidget extends StatelessWidget {
  const ShowDirectionWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          
        },
        child: Ink(
          height: screenSize.height/25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width/75),
            border: Border.all(width: .2,color: isDarkMode?Colors.white:Colors.grey)
          ),
          child: Center(
            child: TextWidget(text: 'Get Direction', color: isDarkMode?Colors.white:Colors.black, size: screenSize.width/35, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
          )
        ),
      ),
    );
  }
}