import 'package:flutter/material.dart';

class LessiImage extends StatelessWidget {
  const LessiImage({
    super.key,
    required this.screenSize,this.isMilkPeda
  });

  final Size screenSize;
  final bool? isMilkPeda;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(screenSize.width/75),
          child: Image.asset(
            (isMilkPeda == true)
                ? 'assets/images/milk peda.webp'
                : 'assets/images/lessi.jpg',
          ),
        ),
        SizedBox(width: screenSize.width / 25,),
      ],
    );
  }
}