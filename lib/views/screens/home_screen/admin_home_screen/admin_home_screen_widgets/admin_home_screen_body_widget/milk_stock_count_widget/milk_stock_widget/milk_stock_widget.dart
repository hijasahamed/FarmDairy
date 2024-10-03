import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MilkStockWidget extends StatelessWidget {
  const MilkStockWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('milkStock')
          .doc('availableMilkStock')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              TextWidget(
                  text: 'Milk Stock : ',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 15,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w400
              ),
              TextWidget(
                  text: 'Loading...',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 15,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w400
              ),
            ],
          );
        }    
        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          return Row(
            children: [
              TextWidget(
                  text: 'Milk Stock : ',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 15,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w400
              ),
              TextWidget(
                  text: 'Error',
                  color: isDarkMode ? Colors.red : Colors.blueGrey,
                  size: screenSize.width / 15,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w400
              ),
            ],
          );
        }
    
        dynamic stock = snapshot.data!['stock'] ?? 0.0;
    
        return Row(
          children: [
            TextWidget(
                text: 'Milk Stock : ',
                color: isDarkMode ? Colors.white : Colors.blueGrey,
                size: screenSize.width / 15,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w400
            ),
            TextWidget(
                text: stock.toString(),
                color: isDarkMode ? Colors.white : Colors.blueGrey,
                size: screenSize.width / 15,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w400
            ),
            TextWidget(
                text: ' Litres',
                color: isDarkMode ? Colors.white : Colors.blueGrey,
                size: screenSize.width / 15,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.w400
            ),
          ],
        );
      },
    );
  }
}