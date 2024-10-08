// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_add_button/add_details_form/add_details_form.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSalesManSubmitButton extends StatelessWidget {
  const AddSalesManSubmitButton({
    super.key,
    required this.formKey,
    required this.screenSize,
    required this.iseditSaleMan,
    required this.documentId
  });

  final GlobalKey<FormState> formKey;
  final Size screenSize;
  final bool? iseditSaleMan;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
          (iseditSaleMan==true)
          ? await updateSalesMan(
            documentId: documentId,
            salesmanName: salesmanNameController.text,
            vehicleNumber: vehicleNumberController.text,
            location: locationController.text,
            mobileNumber: mobileController.text,
            context: context,
            formkey: formKey
          )
          : await addSalesmanDetails(
            salesmanName: salesmanNameController.text,
            vehicleNumber: vehicleNumberController.text,
            location: locationController.text,
            mobileNumber: mobileController.text,
            context: context,
            formkey: formKey
          ).then((value) {
            if(value==true){
              salesmanNameController.clear();
              vehicleNumberController.clear();
              locationController.clear();
              mobileController.clear();
              Navigator.of(context).pop();
              }
          },);          
      },
      child: BlocBuilder<AdminHomeScreenBloc, AdminHomeScreenState>(
        bloc: addSalesPersonRefreshInstance,
        builder: (context, state) {
          if (state is AddSalesManRefreshState) {
            return CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: screenSize.width / 200,
            );
          } else if(state is AddSalesManStopRefreshState){
            return TextWidget(
              text: (iseditSaleMan==true)?'Update':'Submit',
              color: Colors.green,
              size: screenSize.width / 30,
              fontFamily: 'FarmDairyFontNormal',
              weight: FontWeight.bold,
            );
          }
           else {
            return TextWidget(
              text: (iseditSaleMan==true)?'Update':'Submit',
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