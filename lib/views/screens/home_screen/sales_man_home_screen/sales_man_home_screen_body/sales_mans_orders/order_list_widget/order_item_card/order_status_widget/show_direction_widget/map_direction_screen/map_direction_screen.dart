import 'package:farm_dairy/controllers/google_map_show_direction_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDirectionScreen extends StatefulWidget {
  const MapDirectionScreen({
    super.key,
    required this.locationLatLng,
    required this.screenSize,
    required this.shopName,
  });
  final LatLng locationLatLng;
  final Size screenSize;
  final String shopName;

  @override
  State<MapDirectionScreen> createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.shopName.toUpperCase(),
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: widget.screenSize.width / 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'FarmDairyFontNormal',
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.locationLatLng,
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
        },
        myLocationButtonEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId('_destinationLoc'),
            position: widget.locationLatLng,
          ),
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: TextButton(
          onPressed: () {
            openGoogleMaps(widget.locationLatLng);
          }, 
          child: TextWidget(text: 'Show Direction', color: Colors.blue, size: widget.screenSize.width/20, fontFamily: '', weight: FontWeight.w400)
        ),
      ),
    );
  }
}