import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.salesmanName,
    required this.isDarkMode,
    required this.screenSize,
    required this.vehicleNumber,
    required this.location,
    required this.mobileNumber,
  });

  final String salesmanName;
  final bool isDarkMode;
  final Size screenSize;
  final String vehicleNumber;
  final String location;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [                  
        TextWidget(text: 'Name: $salesmanName', color: isDarkMode ? Colors.white : Colors.black, size: screenSize.width / 30, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w700),
        TextWidget(text: 'Vehicle: $vehicleNumber', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width / 32, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w700),
        TextWidget(text: 'Location: $location', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width / 32, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w700),
        TextWidget(text: 'Mobile: $mobileNumber', color: isDarkMode ? Colors.white : Colors.blueGrey, size: screenSize.width / 32, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.w700),
      ],
    );
  }
}