import 'package:farm_dairy/controllers/retailer_purchase_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/retailer_purchase_screen/retailer_purchase_screen.dart';
import 'package:flutter/material.dart';

class AddItemCount extends StatefulWidget {
  const AddItemCount({
    super.key,
    required this.isDarkMode,
    required this.widget,
    required this.stockValue
  });

  final bool isDarkMode;
  final RetailerPurchaseScreen widget;
  final int stockValue;

  @override
  State<AddItemCount> createState() => _AddItemCountState();
}

class _AddItemCountState extends State<AddItemCount> {
  String itemStatusText = 'Item Count';
   @override
  void initState() {
    super.initState();
    itemCountController.addListener(_checkItemCount);
  }

  void _checkItemCount() {
    setState(() {
      int? enteredItemCount = int.tryParse(itemCountController.text);

      if (enteredItemCount != null) {
        if (enteredItemCount > widget.stockValue) {
          itemStatusText = 'Item more than stock';
        } else {
          itemStatusText = 'Item Count';
        }
      } else {
        itemStatusText = 'Invalid input';
      }
    });
  }

  @override
  void dispose() {
    itemCountController.clear();
    villageController.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: itemStatusText,
          color: widget.isDarkMode ? Colors.white : Colors.black,
          size: widget.widget.screenSize.width / 30,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w400,
        ),
        TextFormField(
          controller: itemCountController,
          style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.isDarkMode ? Colors.grey[900]! : const Color.fromARGB(255, 235, 235, 235),
            hintText: 'Enter item count',
            hintStyle: TextStyle(color: widget.isDarkMode ? Colors.grey[500]! : Colors.grey[700]!,fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.widget.screenSize.width / 75),
              borderSide: BorderSide(
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: widget.widget.screenSize.width / 50),
      ],
    );
  }
}