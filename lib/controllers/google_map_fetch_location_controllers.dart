// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/views/screens/google_map_location_pick_screen/bloc/google_map_location_pick_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

GoogleMapLocationPickBloc googleMapLocationPickScreenBlocInstence = GoogleMapLocationPickBloc();
LatLng? currentLocation; // Variable to store the fetched current location
LatLng? draggedPosition; // Variable to store the dragged marker position
GoogleMapController? mapController; // To control the GoogleMap view

// Method to fetch the current location for retailer location fetching
Future<void> fetchCurrentLocation({required BuildContext context}) async {
  Location location = Location();

  try {
    // Check if location services are enabled
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        log('Location services are disabled.');
        showErrorDialog(message: 'Please enable location services', context: context);
        return;
      }
    }

    // Check and request location permissions
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        log('Location permissions are denied.');
        showErrorDialog(message: 'Location permissions are denied.', context: context);
        return;
      }
    }

    if (permissionStatus == PermissionStatus.deniedForever) {
      log('Location permissions are permanently denied.');
      showErrorDialog(
        message: 'Location permissions are permanently denied. We cannot request permissions.',
        context: context,
      );
      return;
    }

    // Fetch the current position using Geolocator for higher accuracy
    geo.Position position = await geo.Geolocator.getCurrentPosition(
      desiredAccuracy: geo.LocationAccuracy.high,
    );

    // Update the current location state
    currentLocation = LatLng(position.latitude, position.longitude);
    draggedPosition = currentLocation;
    googleMapLocationPickScreenBlocInstence.add(GoogleMapLocationPickScreenRefreshEvent());
    fetchedLocationRefreshBlocInstance.add(LocationFetchedRefreshEvent());

    // Move the camera to the user's current location when it's fetched
    mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation!));
  } catch (e) {
    log('Error fetching location: $e');
    showErrorDialog(message: 'Failed to fetch your current location.', context: context);
  }
}

// Method to show error dialogs
void showErrorDialog({required String message,required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}