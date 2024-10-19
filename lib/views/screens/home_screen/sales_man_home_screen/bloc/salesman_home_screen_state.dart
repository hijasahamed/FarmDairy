part of 'salesman_home_screen_bloc.dart';

@immutable
sealed class SalesmanHomeScreenState {}

final class SalesmanHomeScreenInitial extends SalesmanHomeScreenState {}

class SalesManCurrentLocationPickedRefreshState extends SalesmanHomeScreenState {}