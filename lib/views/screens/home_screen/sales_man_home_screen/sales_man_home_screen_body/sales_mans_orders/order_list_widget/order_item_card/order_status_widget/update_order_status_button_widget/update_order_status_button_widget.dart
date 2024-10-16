import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_status_widget/update_order_status_button_widget/order_status_dialog/order_status_dialog.dart';
import 'package:flutter/material.dart';

class UpdateOrderStatusButtonWidget extends StatelessWidget {
  const UpdateOrderStatusButtonWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.documentId,
    required this.title,
    required this.pcs
  });

  final bool isDarkMode;
  final Size screenSize;
  final String documentId;
  final String title;
  final int pcs;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showOrderStatusDialog(context: context, docId: documentId,isDarkMode: isDarkMode,screenSize: screenSize,title: title,pcs: pcs);
      },
      child: TextWidget(
        text: 'Update Status',
        color: isDarkMode ? Colors.white54 : Colors.black54,
        size: screenSize.width / 35,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}