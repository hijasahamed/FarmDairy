// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:farm_dairy/controllers/login_signup_screen_controllers.dart';
import 'package:farm_dairy/views/screens/google_map_location_pick_screen/bloc/google_map_location_pick_bloc.dart';
import 'package:farm_dairy/views/screens/login_signup_screen/bloc/login_signup_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapLocationPickBloc googleMapLocationPickScreenBlocInstence = GoogleMapLocationPickBloc();
LatLng? currentLocation; // Variable to store the fetched current location
LatLng? draggedPosition; // Variable to store the dragged marker position
GoogleMapController? mapController; // To control the GoogleMap view

// Method to fetch the current location for retailer location fetching
Future<void> fetchCurrentLocation({required BuildContext context}) async {
  try {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
      showErrorDialog(message: 'Please enable location services',context: context);
      return;
    }

    // Check and request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied.');
        showErrorDialog(message: 'Location permissions are denied.',context: context);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied.');
      showErrorDialog(message: 'Location permissions are permanently denied. We cannot request permissions.',context: context);
      return;
    }

    // Fetch the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
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
    showErrorDialog(message: 'Failed to fetch your current location.',context: context);
  }
}

// Method to show error dialogs
void showErrorDialog({required String message,required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
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