part of 'google_map_location_pick_bloc.dart';

@immutable
sealed class GoogleMapLocationPickEvent {}

class GoogleMapLocationPickScreenRefreshEvent extends GoogleMapLocationPickEvent {}