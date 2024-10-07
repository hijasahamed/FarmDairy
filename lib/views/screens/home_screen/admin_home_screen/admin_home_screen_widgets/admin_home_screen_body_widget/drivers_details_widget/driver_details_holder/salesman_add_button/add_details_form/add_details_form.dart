// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController salesmanNameController = TextEditingController();
TextEditingController vehicleNumberController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController mobileController = TextEditingController();

AdminHomeScreenBloc addSalesPersonRefreshInstance = AdminHomeScreenBloc();

void showAddSalesmanDialog({
  required BuildContext context,
  required Size screenSize,
  required bool isDarkMode,
}) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        title: TextWidget(
          text: 'Add SalesMan Details',
          color: isDarkMode ? Colors.white : Colors.black,
          size: screenSize.width / 25,
          fontFamily: 'FarmDairyFontNormal',
          weight: FontWeight.bold,
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  controller: salesmanNameController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Salesman Name',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter salesman name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  controller: vehicleNumberController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Vehicle Number',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  controller: locationController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: mobileController,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number';
                    } else if (value.length < 10) {
                      return 'Enter a valid mobile number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          AddSalesManCancelButton(screenSize: screenSize,),
          AddSalesManSubmitButton(formKey: formKey,screenSize: screenSize,),
        ],
      );
    },
  );
}

class AddSalesManCancelButton extends StatelessWidget {
  const AddSalesManCancelButton({
    super.key,
    required this.screenSize
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        salesmanNameController.clear();
        vehicleNumberController.clear();
        locationController.clear();
        mobileController.clear();
        Navigator.of(context).pop();
      },
      child: TextWidget(
        text: 'Cancel',
        color: Colors.red,
        size: screenSize.width / 30,
        fontFamily: 'FarmDairyFontNormal',
        weight: FontWeight.bold,
      ),
    );
  }
}

class AddSalesManSubmitButton extends StatelessWidget {
  const AddSalesManSubmitButton({
    super.key,
    required this.formKey,
    required this.screenSize,
  });

  final GlobalKey<FormState> formKey;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
          await addSalesmanDetails(
            salesmanName: salesmanNameController.text,
            vehicleNumber: vehicleNumberController.text,
            location: locationController.text,
            mobileNumber: mobileController.text,
            context: context,
            formkey: formKey
          );
          salesmanNameController.clear();
          vehicleNumberController.clear();
          locationController.clear();
          mobileController.clear();
          Navigator.of(context).pop();
      },
      child: BlocBuilder<AdminHomeScreenBloc, AdminHomeScreenState>(
        bloc: addSalesPersonRefreshInstance,
        builder: (context, state) {
          if (state is AddSalesManRefreshState) {
            return CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: screenSize.width / 200,
            );
          } else {
            return TextWidget(
              text: 'Submit',
              color: Colors.green,
              size: screenSize.width / 30,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.bold,
            );
          }
        },
      ),
    );
  }
}