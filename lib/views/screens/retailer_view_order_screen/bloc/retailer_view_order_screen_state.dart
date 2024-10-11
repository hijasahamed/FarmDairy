part of 'retailer_view_order_screen_bloc.dart';

@immutable
sealed class RetailerViewOrderScreenState {}

final class RetailerViewOrderScreenInitial extends RetailerViewOrderScreenState {}

class DeleteOrderCircularIndicatorState extends RetailerViewOrderScreenState {}