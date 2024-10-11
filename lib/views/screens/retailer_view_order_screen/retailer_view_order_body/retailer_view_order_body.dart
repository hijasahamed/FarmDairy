import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RetailerViewOrderBody extends StatelessWidget {
  const RetailerViewOrderBody({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.userData
  });
  final Size screenSize;
  final bool isDarkMode;
  final dynamic userData;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('productOrders')
          .where('email', isEqualTo: userData.email)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No orders found'));
        }

        final orderDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orderDocs.length,
          itemBuilder: (context, index) {
            final orderData = orderDocs[index];

            // Extract data from the document
            final String title = orderData['title'];
            final DateTime orderDate = (orderData['orderDate'] as Timestamp).toDate();
            final int totalAmount = orderData['totalAmount'];
            final int itemCount = orderData['itemCount'];

            return Card(
              color: isDarkMode ? Colors.grey[900] : Colors.white,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: $title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Order Date: ${orderDate.toLocal().toString().split(' ')[0]}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Total Amount: ₹$totalAmount',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Item Count: $itemCount',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}