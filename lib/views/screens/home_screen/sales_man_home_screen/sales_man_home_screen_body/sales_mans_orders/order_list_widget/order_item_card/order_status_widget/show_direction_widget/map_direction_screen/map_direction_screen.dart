import 'package:farm_dairy/controllers/google_map_show_direction_controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDirectionScreen extends StatefulWidget {
  const MapDirectionScreen({
    super.key,
    required this.locationLatLng
  });
  final LatLng locationLatLng;
  @override
  State<MapDirectionScreen> createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: googlePlex,
          zoom: 15
        )
      ),
    );
  }
}