import 'package:farm_dairy/controllers/splash_screen_controllers.dart';
import 'package:farm_dairy/views/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoNetworkLoaderWidget extends StatelessWidget {
  const NoNetworkLoaderWidget({
    super.key,
    required this.screenSize
  });
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      bloc: noNetworkLoaderBlocInstance,
      builder: (context, state) {
        if(state is NoNetworkLoaderState){
          return CircularProgressIndicator(
            strokeWidth: screenSize.width/130,
            color: Colors.blue,
          );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}