// ignore_for_file: use_build_context_synchronously

import 'package:farm_dairy/controllers/google_map_fetch_location_controllers.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/bloc/salesman_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng? salesManCurrentLocation; // Variable to store the fetched current location
GoogleMapController? salesManCurrentLocationMapController; // To control the GoogleMap view
SalesmanHomeScreenBloc salesManCurrentLocationPickedRefreshBlocInstance = SalesmanHomeScreenBloc();

final Set<Polyline> polyline = {};
Set<Marker> markers = {};
List<LatLng> pointsOnMap = [];

// Method to fetch the current location
Future<void> fetchSalesManCurrentLocation({required BuildContext context,required LatLng destination}) async {
  try {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showErrorDialog(
          context: context, message: 'Please enable location services.');
      return;
    }

    // Check and request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showErrorDialog(
            context: context, message: 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showErrorDialog(
          context: context,
          message:
              'Location permissions are permanently denied. We cannot request permissions.');
      return;
    }

    // Fetch the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Update the current location state
    salesManCurrentLocation = LatLng(position.latitude, position.longitude);

    // add locations to the List
    pointsOnMap
    ..add(salesManCurrentLocation!)
    ..add(destination);

    for(int i =0;i < pointsOnMap.length;i++){
      markers.add(
        Marker(
          markerId: MarkerId(
            i.toString()
          ),
          position: pointsOnMap[i],
          infoWindow: const InfoWindow(
            title: '',
            snippet: '',           
          ),
          icon: BitmapDescriptor.defaultMarker
        )
      );
      polyline.add(
        Polyline(
          polylineId: const PolylineId('Id'),
          points: pointsOnMap,
          color: Colors.blue        
          )
      );
    }
    
    salesManCurrentLocationPickedRefreshBlocInstance.add(SalesManCurrentLocationPickedRefreshEvent());

    // Move the camera to the user's current location when it's fetched
    mapController?.animateCamera(CameraUpdate.newLatLng(salesManCurrentLocation!));
  } catch (e) {
    showErrorDialog(
        context: context, message: 'Failed to fetch your current location.');
  }
}