import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class StockCount extends StatelessWidget {
  const StockCount(
      {super.key,
      required this.isDarkMode,
      required this.screenSize,
      this.isMilkPeda});
  final bool isDarkMode;
  final Size screenSize;
  final bool? isMilkPeda;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productStocks')
          .doc((isMilkPeda==true)?'milkPedaStock':'lassiStock')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            strokeWidth: .4,
            color: Colors.blue,
          );
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return TextWidget(
            text: '0',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 30,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w600,
          );
        }
        var stock = snapshot.data!.get('stock');
        return TextWidget(
          text: stock.toString(),
          color: isDarkMode ? Colors.white : Colors.blueGrey,
          size: screenSize.width / 15,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w600,
        );
      },
    );
  }
}
