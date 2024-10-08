// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_back_button/form_back_button.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_content/form_content.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/admin_home_screen_widgets/admin_home_screen_body_widget/drivers_details_widget/driver_details_holder/salesman_details_holder/available_details_widget/address_holder_widget/delete_address_widget/delete_salesman_form/form_title/form_title.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteSalesManForm extends StatelessWidget {
  const DeleteSalesManForm({
    super.key,
    required this.isDarkMode,
    required this.screenSize,
    required this.documentId,
  });

  final bool isDarkMode;
  final Size screenSize;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeleteSalesManCubit(),
      child: BlocBuilder<DeleteSalesManCubit, DeleteSalesManState>(
        builder: (context, state) {
          return AlertDialog(
            title: FormTitle(isDarkMode: isDarkMode, screenSize: screenSize),
            content: FormContent(isDarkMode: isDarkMode, screenSize: screenSize),
            actions: [
              FormBackButton(isDarkMode: isDarkMode, screenSize: screenSize),
              TextButton(
                onPressed: state == DeleteSalesManState.loading
                    ? null
                    : () {
                        context.read<DeleteSalesManCubit>().deleteSalesManBloc(documentId, context);
                      },
                child: state == DeleteSalesManState.loading
                    ? SizedBox(
                        width: screenSize.width / 30,
                        height: screenSize.width / 30,
                        child: const CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 2,
                        ),
                      )
                    : TextWidget(
                        text: 'Delete',
                        color: Colors.red,
                        size: screenSize.width / 30,
                        fontFamily: 'FarmDairyFontNormal',
                        weight: FontWeight.bold,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}





