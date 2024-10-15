import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
    required this.email,
    required this.itemCount,
    required this.orderDate,
    required this.title,
    required this.totalAmount,
    required this.update,
    required this.documentId,
    required this.isDarkMode,
    required this.screenSize,
  });

  final String email;
  final int itemCount;
  final DateTime orderDate;
  final String title;
  final int totalAmount;
  final String update;
  final String documentId;
  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      margin: EdgeInsets.all(screenSize.width / 40),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width / 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Email: $email', style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Items: $itemCount', style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Total Amount: ₹$totalAmount', style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Order Date: ${orderDate.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Status: $update', style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black)),
            Text('Document ID: $documentId', style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white60 : Colors.black54)),
          ],
        ),
      ),
    );
  }
}