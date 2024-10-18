part of 'google_map_location_pick_bloc.dart';

@immutable
sealed class GoogleMapLocationPickState {}

final class GoogleMapLocationPickInitial extends GoogleMapLocationPickState {}

class GoogleMapLocationPickScreenRefreshState extends GoogleMapLocationPickState {}