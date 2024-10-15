import 'package:farm_dairy/models/salesman_model/salesman_model.dart';
import 'package:flutter/material.dart';

class SalesManHomeScreen extends StatelessWidget {
  const SalesManHomeScreen({
    super.key,
    required this.salesmanData,
    required this.screenSize
  });
  final Size screenSize;
  final SalesmanData salesmanData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(salesmanData.salesManName),
      ),
    );
  }
}