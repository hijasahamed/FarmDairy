import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/sales_man_home_screen_body/sales_mans_orders/order_list_widget/order_item_card/order_status_widget/show_direction_widget/map_direction_screen/map_direction_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowDirectionWidget extends StatelessWidget {
  const ShowDirectionWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    required this.destination
  });

  final Size screenSize;
  final bool isDarkMode;
  final LatLng destination;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapDirectionScreen(locationLatLng: destination,screenSize: screenSize,),
            ),
          );
        },
        child: Ink(
          height: screenSize.height/25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width/75),
            border: Border.all(width: .2,color: isDarkMode?Colors.white:Colors.grey)
          ),
          child: Center(
            child: TextWidget(text: 'Get Direction', color: isDarkMode?Colors.white:Colors.black, size: screenSize.width/35, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
          )
        ),
      ),
    );
  }
}