import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_category_header/order_category_header.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_list_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/no_order_widget/no_order_widget.dart';
import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/order_loading_widget/order_loading_widget.dart';
import 'package:flutter/material.dart';

class SalesMansOrders extends StatelessWidget {
  const SalesMansOrders({
    super.key,
    required this.salesmanData,
    required this.isDarkMode,
    required this.screenSize,
  });

  final SalesmanData salesmanData;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('productOrders')
            .where('village', isEqualTo: salesmanData.location)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const OrderLoadingWidget();
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return NoOrderWidget(isDarkMode: isDarkMode, screenSize: screenSize);
          }        
          final orderDocs = snapshot.data!.docs;    
          final DateTime now = DateTime.now();
          final DateTime today = DateTime(now.year, now.month, now.day);
          final DateTime yesterday = today.subtract(const Duration(days: 1));
      
          List<QueryDocumentSnapshot> salesMansTodaysOrders = [];
          List<QueryDocumentSnapshot> salesMansYesterdaysOrders = [];
          List<QueryDocumentSnapshot> salesMansEarlierOrders = [];
      
          for (var order in orderDocs) {
            final orderDate = (order['orderDate'] as Timestamp).toDate();
            final DateTime orderDay = DateTime(orderDate.year, orderDate.month, orderDate.day);
      
            if (orderDay.isAtSameMomentAs(today)) {
              salesMansTodaysOrders.add(order);
            } else if (orderDay.isAtSameMomentAs(yesterday)) {
              salesMansYesterdaysOrders.add(order);
            } else {
              salesMansEarlierOrders.add(order);
            }
          }
              
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (salesMansTodaysOrders.isNotEmpty) ...[
                  OrderCategoryHeader(title: "Today's Orders", isDarkMode: isDarkMode,screenSize: screenSize,),
                  OrderList(orders: salesMansTodaysOrders, isDarkMode: isDarkMode, screenSize: screenSize),
                ],
                if (salesMansYesterdaysOrders.isNotEmpty) ...[
                  OrderCategoryHeader(title: "Yesterday's Orders", isDarkMode: isDarkMode,screenSize: screenSize,),
                  OrderList(orders: salesMansYesterdaysOrders, isDarkMode: isDarkMode, screenSize: screenSize),
                ],
                if (salesMansEarlierOrders.isNotEmpty) ...[
                  OrderCategoryHeader(title: "Earlier Orders", isDarkMode: isDarkMode,screenSize: screenSize,),
                  OrderList(orders: salesMansEarlierOrders, isDarkMode: isDarkMode, screenSize: screenSize),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}