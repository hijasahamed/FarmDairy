import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ViewSalesManOrdersAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ViewSalesManOrdersAppBar({
    super.key,
    required this.isDarkMode,
    required this.salesManLocation,
    required this.screenSize,
  });

  final bool isDarkMode;
  final String salesManLocation;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isDarkMode?Colors.black:Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        }, 
        icon: Icon(Icons.arrow_back_ios_new_rounded,color: isDarkMode?Colors.white:Colors.grey,)
      ),
      title: TextWidget(text: 'Orders From $salesManLocation Panchayath', color: isDarkMode?Colors.white:Colors.blueGrey, size: screenSize.width/28, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/11);
}