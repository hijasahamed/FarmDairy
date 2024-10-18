import 'dart:developer';

import 'package:farm_dairy/controllers/google_map_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/google_map_location_pick_screen/bloc/google_map_location_pick_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapLocationPickScreen extends StatefulWidget {
  const GoogleMapLocationPickScreen(
      {super.key, required this.isDarkMode, required this.screenSize});
  final bool isDarkMode;
  final Size screenSize;
  @override
  State<GoogleMapLocationPickScreen> createState() =>
      _GoogleMapLocationPickScreenState();
}

class _GoogleMapLocationPickScreenState
    extends State<GoogleMapLocationPickScreen> {
  

  @override
  void initState() {
    super.initState();
    fetchCurrentLocation(context: context); // Fetch the current location when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapLocationPickBloc, GoogleMapLocationPickState>(
       bloc: googleMapLocationPickScreenBlocInstence,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TextWidget(
                text: 'Select Location',
                color: Colors.blueGrey,
                size: widget.screenSize.width / 25,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.bold),
          ),
          body: currentLocation == null // Check if location is fetched
              ? const Center(
                  child:
                      CircularProgressIndicator()) // Show loading until location is fetched
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
                        draggedPosition = newPosition;
                        googleMapLocationPickScreenBlocInstence.add(GoogleMapLocationPickScreenRefreshEvent());
                        log(
                            "Marker dragged to: ${newPosition.latitude}, ${newPosition.longitude}");
                      },
                    ),
                  },
                ),
        );
      },
    );
  }
}