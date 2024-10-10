import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AvailableStockCountWidget extends StatelessWidget {
  const AvailableStockCountWidget({
    super.key,
    required this.stockName,
    required this.screenSize
  });

  final String stockName;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('productStocks')
          .doc(stockName)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        if (snapshot.hasError) {
          return const SizedBox.shrink();
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox.shrink();
        }
        var stock = snapshot.data!['stock'];
        return TextWidget(
          text: 'Available Stock : $stock Pcs', 
          color: (stock=='0')? Colors.red:Colors.green, 
          size: screenSize.width / 35, 
          fontFamily: 'FarmDairyFontNormal', 
          weight: FontWeight.bold,
          maxline: true,
        );
      },
    );
  }
}