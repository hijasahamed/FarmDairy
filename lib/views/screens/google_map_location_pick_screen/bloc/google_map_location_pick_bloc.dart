import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'google_map_location_pick_event.dart';
part 'google_map_location_pick_state.dart';

class GoogleMapLocationPickBloc extends Bloc<GoogleMapLocationPickEvent, GoogleMapLocationPickState> {
  GoogleMapLocationPickBloc() : super(GoogleMapLocationPickInitial()) {
    on<GoogleMapLocationPickEvent>((event, emit) {
      
    });
    on<GoogleMapLocationPickScreenRefreshEvent>(googleMapLocationPickScreenRefreshEvent);
  }

  FutureOr<void> googleMapLocationPickScreenRefreshEvent(
    GoogleMapLocationPickScreenRefreshEvent event, Emitter<GoogleMapLocationPickState> emit) {
      emit(GoogleMapLocationPickScreenRefreshState());
  }
}
