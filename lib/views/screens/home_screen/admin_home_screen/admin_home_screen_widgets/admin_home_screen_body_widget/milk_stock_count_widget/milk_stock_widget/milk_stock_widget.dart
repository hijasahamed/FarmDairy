import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/milk_stock_widget/milk_stock_connecting/milk_stock_connecting.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/milk_stock_widget/milk_stock_error/milk_stock_error.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/milk_stock_widget/milk_stock_result/milk_stock_result.dart';
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
          return MilkStockConnectingWidget(isDarkMode: isDarkMode, screenSize: screenSize);
        }    
        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          return MilkStockErrorWidget(isDarkMode: isDarkMode, screenSize: screenSize);
        }    
        dynamic stock = snapshot.data!['stock'] ?? 0.0;    
        return MilkStockResult(isDarkMode: isDarkMode, screenSize: screenSize, stock: stock);
      },
    );
  }
}