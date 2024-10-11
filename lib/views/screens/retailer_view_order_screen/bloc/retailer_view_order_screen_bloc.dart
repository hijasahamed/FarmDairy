import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'retailer_view_order_screen_event.dart';
part 'retailer_view_order_screen_state.dart';

class RetailerViewOrderScreenBloc extends Bloc<RetailerViewOrderScreenEvent, RetailerViewOrderScreenState> {
  RetailerViewOrderScreenBloc() : super(RetailerViewOrderScreenInitial()) {
    on<RetailerViewOrderScreenEvent>((event, emit) {
      
    });
    on<DeleteOrderCircularIndicatorEvent>(deleteOrderCircularIndicatorEvent);
  }

  FutureOr<void> deleteOrderCircularIndicatorEvent(
    DeleteOrderCircularIndicatorEvent event, Emitter<RetailerViewOrderScreenState> emit) {
      emit(DeleteOrderCircularIndicatorState());
  }
}
