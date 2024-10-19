import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'salesman_home_screen_event.dart';
part 'salesman_home_screen_state.dart';

class SalesmanHomeScreenBloc extends Bloc<SalesmanHomeScreenEvent, SalesmanHomeScreenState> {
  SalesmanHomeScreenBloc() : super(SalesmanHomeScreenInitial()) {
    on<SalesmanHomeScreenEvent>((event, emit) {
      
    });
    on<SalesManCurrentLocationPickedRefreshEvent>(salesManCurrentLocationPickedRefreshEvent);
  }

  FutureOr<void> salesManCurrentLocationPickedRefreshEvent(
    SalesManCurrentLocationPickedRefreshEvent event, Emitter<SalesmanHomeScreenState> emit) {
      emit(SalesManCurrentLocationPickedRefreshState());
  }
}
