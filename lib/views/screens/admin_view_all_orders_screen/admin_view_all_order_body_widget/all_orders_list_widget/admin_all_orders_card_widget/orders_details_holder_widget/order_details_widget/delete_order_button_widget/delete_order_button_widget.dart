import 'package:farm_dairy/views/screens/admin_view_all_orders_screen/admin_view_all_order_body_widget/all_orders_list_widget/admin_all_orders_card_widget/orders_details_holder_widget/order_details_widget/delete_order_button_widget/show_delete_confirmation_dialog/show_delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';

class DeleteOrderButtonWidget extends StatelessWidget {
  const DeleteOrderButtonWidget({
    super.key,
    required this.documentId,
    required this.screenSize,
    required this.isDarkMode
  });

  final String documentId;
  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDeleteConfirmationDialog(context: context,isDarkMode: isDarkMode,screenSize: screenSize,documentId: documentId);
      },
      icon: Icon(
        Icons.delete,
        color: Colors.red,
        size: screenSize.width / 25,
      )
    );
  }
}




  