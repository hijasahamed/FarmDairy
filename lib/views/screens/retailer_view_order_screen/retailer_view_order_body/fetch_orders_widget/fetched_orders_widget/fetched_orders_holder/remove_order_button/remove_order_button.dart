import 'package:farm_dairy/views/screens/retailer_view_order_screen/retailer_view_order_body/fetch_orders_widget/fetched_orders_widget/fetched_orders_holder/remove_order_button/remove_order_alert_dialoge/remove_order_alert_dialoge.dart';
import 'package:flutter/material.dart';

class RemoveOrderButton extends StatelessWidget {
  const RemoveOrderButton({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.documentId
  });

  final Size screenSize;
  final bool isDarkMode;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return RemoveOrderAlertDialog(isDarkMode: isDarkMode, screenSize: screenSize, documentId: documentId);
          },
        );
      },
      icon: Icon(
        Icons.delete,
        size: screenSize.width / 21,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}