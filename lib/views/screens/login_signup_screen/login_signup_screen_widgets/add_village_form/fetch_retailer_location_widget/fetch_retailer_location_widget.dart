import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/google_map_location_pick_screen/google_map_location_pick_screen.dart';
import 'package:flutter/material.dart';

class FetchRetailersLocationWidget extends StatelessWidget {
  const FetchRetailersLocationWidget({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
  });

  final Size screenSize;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/30,bottom: screenSize.width/10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return GoogleMapLocationPickScreen(isDarkMode: isDarkMode,screenSize: screenSize,);
          },));
        },
        child: Ink(
          height: screenSize.height/16.5,
          width: screenSize.width/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width/75),
            border: Border.all(width: .3,color: isDarkMode?Colors.white:Colors.grey)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Google-Maps-logo.png',height: screenSize.width/6,width: screenSize.width/6,),
              TextWidget(text: 'Get Location', color: isDarkMode?Colors.white:Colors.black, size: screenSize.width/32, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}