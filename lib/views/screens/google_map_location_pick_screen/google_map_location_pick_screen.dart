import 'dart:developer';

import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapLocationPickScreen extends StatefulWidget {
  const GoogleMapLocationPickScreen({
    super.key,
    required this.isDarkMode,
    required this.screenSize
  });
  final bool isDarkMode;
  final Size screenSize;
  @override
  State<GoogleMapLocationPickScreen> createState() => _GoogleMapLocationPickScreenState();
}

class _GoogleMapLocationPickScreenState extends State<GoogleMapLocationPickScreen> {
  LatLng? currentLocation; // Variable to store the fetched current location
  LatLng? draggedPosition; // Variable to store the dragged marker position
  GoogleMapController? mapController; // To control the GoogleMap view

  @override
  void initState() {
    super.initState();
    fetchCurrentLocation(); // Fetch the current location when the screen is loaded
  }

  // Method to fetch the current location
  Future<void> fetchCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        log('Location services are disabled.');
        showErrorDialog('Please enable location services');
        return;
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied.');
          showErrorDialog('Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('Location permissions are permanently denied.');
        showErrorDialog(
            'Location permissions are permanently denied. We cannot request permissions.');
        return;
      }

      // Fetch the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update the current location state
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });

      // Move the camera to the user's current location when it's fetched
      mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation!));
    } catch (e) {
      print('Error fetching location: $e');
      showErrorDialog('Failed to fetch your current location.');
    }
  }

  // Method to show error dialogs
  void showErrorDialog(String message) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextWidget(text: 'Select Location', color: Colors.blueGrey, size: widget.screenSize.width/25, fontFamily: 'FarmDairyFontNormal', weight: FontWeight.bold),
      ),
      body: currentLocation == null // Check if location is fetched
          ? const Center(child: CircularProgressIndicator()) // Show loading until location is fetched
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: {
                Marker(
                  markerId: const MarkerId('Marker Id'),
                  position: currentLocation!,
                  draggable: true,
                  onDragEnd: (LatLng newPosition) {
                    setState(() {
                      draggedPosition = newPosition;
                    });
                    print(
                        "Marker dragged to: ${newPosition.latitude}, ${newPosition.longitude}");
                  },
                ),
              },
            ),
    );
  }
}