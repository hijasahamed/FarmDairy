import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) {
      
    });
    on<NoNetworkLoaderEvent>(noNetworkLoaderEvent);
  }

  FutureOr<void> noNetworkLoaderEvent(
    NoNetworkLoaderEvent event, Emitter<SplashScreenState> emit) {
      emit(NoNetworkLoaderState());      
  }
}
