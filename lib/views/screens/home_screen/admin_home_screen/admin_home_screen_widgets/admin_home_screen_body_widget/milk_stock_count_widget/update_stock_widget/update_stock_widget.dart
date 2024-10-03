import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/milk_stock_count_widget/update_stock_widget/update_button_widget/update_button_widget.dart';
import 'package:flutter/material.dart';

class UpdateMilkStock extends StatelessWidget {
  const UpdateMilkStock({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height / 50,
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {

            },
            child: UpdateButtonWidget(screenSize: screenSize, isDarkMode: isDarkMode),
          ),
        ),
        SizedBox(
          height: screenSize.height / 50,
        )
      ],
    );
  }
}