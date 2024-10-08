import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/admin_home_screen/bloc/admin_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDeleteButton extends StatelessWidget {
  const FormDeleteButton({
    super.key,
    required this.documentId,
    required this.screenSize,
  });

  final String documentId;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeleteSalesManCubit(),
      child: BlocBuilder<DeleteSalesManCubit, DeleteSalesManState>(
        builder: (context, state) {
          return TextButton(
            onPressed: state == DeleteSalesManState.loading
                ? null
                : () {
                    context
                        .read<DeleteSalesManCubit>()
                        .deleteSalesManBloc(documentId, context);
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
          );
        },
      ),
    );
  }
}