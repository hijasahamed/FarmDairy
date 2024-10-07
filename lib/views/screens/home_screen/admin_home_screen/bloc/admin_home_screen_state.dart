part of 'admin_home_screen_bloc.dart';

@immutable
sealed class AdminHomeScreenState {}

final class AdminHomeScreenInitial extends AdminHomeScreenState {}

class AddSalesManRefreshState extends AdminHomeScreenState {}

class AddSalesManStopRefreshState extends AdminHomeScreenState {}