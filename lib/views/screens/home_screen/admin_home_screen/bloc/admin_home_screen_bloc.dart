import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_home_screen_event.dart';
part 'admin_home_screen_state.dart';

class AdminHomeScreenBloc extends Bloc<AdminHomeScreenEvent, AdminHomeScreenState> {
  AdminHomeScreenBloc() : super(AdminHomeScreenInitial()) {
    on<AdminHomeScreenEvent>((event, emit) {
      
    });
    on<AddSalesManRefreshEvent>(addSalesManRefreshEvent);
  }

  FutureOr<void> addSalesManRefreshEvent(
    AddSalesManRefreshEvent event, Emitter<AdminHomeScreenState> emit) {
      emit(AddSalesManRefreshState());
  }
}
