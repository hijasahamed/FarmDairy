import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_status_widget/update_order_status_button_widget/update_order_status_button_widget.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
    required this.update,
    required this.screenSize,
    required this.isDarkMode,
    required this.documentId
  });

  final String update;
  final Size screenSize;
  final bool isDarkMode;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: update,
          color: (update == 'Order Placed')
              ? Colors.lightBlue
              : (update == 'Deliverd')
                  ? Colors.green
                  : Colors.redAccent,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
        ),
        const Spacer(),
        UpdateOrderStatusButtonWidget(isDarkMode: isDarkMode, screenSize: screenSize,documentId: documentId,)
      ],
    );
  }
}