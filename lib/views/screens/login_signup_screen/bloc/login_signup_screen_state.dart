part of 'login_signup_screen_bloc.dart';

@immutable
sealed class LoginSignupScreenState {}

final class LoginSignupScreenInitial extends LoginSignupScreenState {}

class ShowSignupFunctionsWhenCreatingAccountState extends LoginSignupScreenState {}

class ShowLoginFunctionsWhenCreatingAccountState extends LoginSignupScreenState {}