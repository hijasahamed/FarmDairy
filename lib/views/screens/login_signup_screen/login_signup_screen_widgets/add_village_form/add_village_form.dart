import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_form_field_widget.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/login_signup_screen_widgets/add_village_form/fetch_retailer_location_widget/fetch_retailer_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddVillageForm extends StatelessWidget {
  const AddVillageForm({
    super.key,
    required this.screenSize,
    required this.isDarkMode,
    });
  final Size screenSize;
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
      bloc: showSignupFunctionBlocInstance,
      builder: (context, state) {
        if(state is ShowSignupFunctionsWhenCreatingAccountState && roleController.text == 'Retailer'){
           return Column(
            children: [
              CustomTextFormField(
                controller: villageController,
                label: 'Village',
                obscureText: false,
                keyboardType: TextInputType.none,
                screenSize: screenSize,
                isDarkMode: isDarkMode,
                isVillage: true,
              ),
              FetchRetailersLocationWidget(screenSize: screenSize, isDarkMode: isDarkMode),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

