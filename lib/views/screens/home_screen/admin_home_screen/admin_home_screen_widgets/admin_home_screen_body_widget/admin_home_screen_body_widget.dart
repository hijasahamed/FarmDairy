import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminHomeScreenBodyWidget extends StatelessWidget {
  const AdminHomeScreenBodyWidget(
      {super.key, required this.screenSize, required this.isDarkMode});
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width / 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilkStockCountWidget(isDarkMode: isDarkMode, screenSize: screenSize),
          LessiStockCount(screenSize: screenSize, isDarkMode: isDarkMode)
        ],
      ),
    );
  }
}

class LessiStockCount extends StatelessWidget {
  const LessiStockCount({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenSize.width / 40),
      height: screenSize.height / 5,
      width: screenSize.width,
      decoration: BoxDecoration(
        border: Border.all(width: .1),
        borderRadius: BorderRadius.circular(screenSize.width/50)
      ),
      child: Row(
        children: [
          Image.asset('assets/images/lessi.jpg'),
          SizedBox(
            width: screenSize.width / 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                  text: 'Lassi',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 20,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w600),
              TextWidget(
                  text: 'Stock Count:',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 25,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w600),
              TextWidget(
                  text: '888',
                  color: isDarkMode ? Colors.white : Colors.blueGrey,
                  size: screenSize.width / 15,
                  fontFamily: 'FarmDairyFontNormal',
                  weight: FontWeight.w600),
            ],
          )
        ],
      ),
    );
  }
}

class MilkStockCountWidget extends StatelessWidget {
  const MilkStockCountWidget({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
  });

  final bool isDarkMode;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
    return Column(
      children: [
        TextWidget(
          text: 'Today: $formattedDate',
          color: isDarkMode ? Colors.white : Colors.blueGrey,
          size: screenSize.width / 20,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.w400,
        ),
        SizedBox(height: screenSize.height / 60),
        TextWidget(
            text: 'Milk Stock : 250.65 Litres',
            color: isDarkMode ? Colors.white : Colors.blueGrey,
            size: screenSize.width / 15,
            fontFamily: 'FarmDairyFontNormal',
            weight: FontWeight.w400),
        SizedBox(height: screenSize.height/30,)
      ],
    );
  }
}
