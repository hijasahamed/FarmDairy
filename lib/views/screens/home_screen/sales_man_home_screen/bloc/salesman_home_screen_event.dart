part of 'salesman_home_screen_bloc.dart';

@immutable
sealed class SalesmanHomeScreenEvent {}

class SalesManCurrentLocationPickedRefreshEvent extends SalesmanHomeScreenEvent {}