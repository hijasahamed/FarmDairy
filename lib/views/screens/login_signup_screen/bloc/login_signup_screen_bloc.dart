import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_signup_screen_event.dart';
part 'login_signup_screen_state.dart';

class LoginSignupScreenBloc extends Bloc<LoginSignupScreenEvent, LoginSignupScreenState> {
  LoginSignupScreenBloc() : super(LoginSignupScreenInitial()) {
    on<LoginSignupScreenEvent>((event, emit) {
      
    });
    on<ShowSignupFunctionsWhenCreatingAccountEvent>(showSignupFunctionsWhenCreatingAccountEvent);
    on<ShowLoginFunctionsWhenCreatingAccountEvent>(showLoginFunctionsWhenCreatingAccountEvent);
  }

  FutureOr<void> showSignupFunctionsWhenCreatingAccountEvent(
    ShowSignupFunctionsWhenCreatingAccountEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(ShowSignupFunctionsWhenCreatingAccountState());
  }

  FutureOr<void> showLoginFunctionsWhenCreatingAccountEvent(
    ShowLoginFunctionsWhenCreatingAccountEvent event, Emitter<LoginSignupScreenState> emit) {
      emit(ShowLoginFunctionsWhenCreatingAccountState());
  }
}
