part of 'login_signup_screen_bloc.dart';

@immutable
sealed class LoginSignupScreenEvent {}

class ShowSignupFunctionsWhenCreatingAccountEvent extends LoginSignupScreenEvent {}

class ShowLoginFunctionsWhenCreatingAccountEvent extends LoginSignupScreenEvent {}