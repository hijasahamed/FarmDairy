import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:meta/meta.dart';

part 'login_signup_screen_event.dart';
part 'login_signup_screen_state.dart';

class LoginSignupScreenBloc extends Bloc<LoginSignupScreenEvent, LoginSignupScreenState> {
  LoginSignupScreenBloc() : super(LoginSignupScreenInitial()) {
    on<LoginSignupScreenEvent>((event, emit) {
      
    });
    on<ShowSignupFunctionsWhenCreatingAccountEvent>(showSignupFunctionsWhenCreatingAccountEvent);
    on<ShowLoginFunctionsWhenCreatingAccountEvent>(showLoginFunctionsWhenCreatingAccountEvent);
    on<SignUpAndLoginCircularIndicatorEvent>(signUpAndLoginCircularIndicatorEvent);
    on<SignUpAndLoginCircularIndicatorStopEvent>(signUpAndLoginCircularIndicatorStopEvent);
    on<ShowAddVillageFormForRetailerEvent>(showAddVillageFormForRetailerEvent);
    on<LocationFetchedRefreshEvent>(locationFetchedRefreshEvent);
  }

  FutureOr<void> showSignupFunctionsWhenCreatingAccountEvent(
    ShowSignupFunctionsWhenCreatingAccountEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(ShowSignupFunctionsWhenCreatingAccountState());
  }

  FutureOr<void> showLoginFunctionsWhenCreatingAccountEvent(
    ShowLoginFunctionsWhenCreatingAccountEvent event, Emitter<LoginSignupScreenState> emit) {
      roleController.clear();
      emit(ShowLoginFunctionsWhenCreatingAccountState());
  }

  FutureOr<void> signUpAndLoginCircularIndicatorEvent(
    SignUpAndLoginCircularIndicatorEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(SignUpAndLoginCircularIndicatorState());
  }

  FutureOr<void> signUpAndLoginCircularIndicatorStopEvent(
    SignUpAndLoginCircularIndicatorStopEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(SignUpAndLoginCircularIndicatorStopState());
  }

  FutureOr<void> showAddVillageFormForRetailerEvent(
    ShowAddVillageFormForRetailerEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(ShowAddVillageFormForRetailerState());
  }

  FutureOr<void> locationFetchedRefreshEvent(
    LocationFetchedRefreshEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(LocationFetchedRefreshState());
  }
}
