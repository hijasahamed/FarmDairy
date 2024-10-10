import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.imageUrl,
    required this.screenSize,
  });

  final String imageUrl;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: screenSize.width / 2.3,
      height: screenSize.height / 7,
      fit: BoxFit.cover,
    );
  }
}