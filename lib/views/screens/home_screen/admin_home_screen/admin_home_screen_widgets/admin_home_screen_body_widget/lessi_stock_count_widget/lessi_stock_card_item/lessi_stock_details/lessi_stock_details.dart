import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/lessi_stock_count/lessi_stock_count.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/text_lessi_and_stockcount/text_lessi_and_stockcount.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/lessi_stock_count_widget/lessi_stock_card_item/lessi_stock_details/update_lessi_form/update_lessi_form.dart';
import 'package:flutter/material.dart';

class LessiStockDetails extends StatelessWidget {
  const LessiStockDetails({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    this.isMilkPeda
  });

  final bool isDarkMode;
  final Size screenSize;
  final bool? isMilkPeda;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextLessi(isDarkMode: isDarkMode, screenSize: screenSize,isMilkPeda: isMilkPeda,),
        TextStockCount(isDarkMode: isDarkMode, screenSize: screenSize),
        LassiStockCount(isDarkMode: isDarkMode, screenSize: screenSize,isMilkPeda: isMilkPeda,),
        Row(
          children: [
            IconButton(
              onPressed: () {
                addProductStockForm(context: context, isDarkMode: isDarkMode, screenSize: screenSize, isReduceStock: false,isMilkPeda: isMilkPeda);
              }, 
              icon: Icon(Icons.add_circle_outline_sharp,color: Colors.green,size: screenSize.width/12,)
            ),
            SizedBox(width: screenSize.width/15,),
            IconButton(
              onPressed: () {
                addProductStockForm(context: context, isDarkMode: isDarkMode, screenSize: screenSize, isReduceStock: true,isMilkPeda: isMilkPeda);
              }, 
              icon: Icon(Icons.remove_circle_outline,color: Colors.red,size: screenSize.width/12,)
            ),
          ],
        )
      ],
    );
  }
}