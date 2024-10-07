import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:flutter/material.dart';

class SalesManAddButton extends StatelessWidget {
  const SalesManAddButton({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showAddSalesmanDialog(context: context,isDarkMode: isDarkMode,screenSize: screenSize);
        },
        child: TextWidget(
          text: 'Add SalesMan',
          color: Colors.green,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold
        )
      ),
    );
  }
}