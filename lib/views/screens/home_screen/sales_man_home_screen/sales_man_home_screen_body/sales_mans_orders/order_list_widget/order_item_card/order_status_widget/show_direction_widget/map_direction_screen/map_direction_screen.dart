import 'package:farm_dairy/controllers/google_map_show_direction_controllers.dart';
import 'package:farm_dairy/models/common_widgets/text_widget.dart';
import 'package:farm_dairy/views/screens/home_screen/sales_man_home_screen/bloc/salesman_home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDirectionScreen extends StatefulWidget {
  const MapDirectionScreen(
      {super.key, required this.locationLatLng, required this.screenSize});
  final LatLng locationLatLng;
  final Size screenSize;
  @override
  State<MapDirectionScreen> createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {
  @override
  void initState() {
    super.initState();
    fetchSalesManCurrentLocation(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesmanHomeScreenBloc, SalesmanHomeScreenState>(
      bloc: salesManCurrentLocationPickedRefreshBlocInstance,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: TextWidget(
                text: 'Direction',
                color: Colors.blueGrey,
                size: widget.screenSize.width / 25,
                fontFamily: 'FarmDairyFontNormal',
                weight: FontWeight.bold),
          ),
          body: salesManCurrentLocation == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: salesManCurrentLocation!,
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    salesManCurrentLocationMapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId('_salesmanCurrentLoc'),
                      position: salesManCurrentLocation!,
                      draggable: true,
                    ),
                    Marker(
                      markerId: const MarkerId('_destinationLoc'),
                      position: widget.locationLatLng,
                      draggable: true,
                    ),
                  },
                ),
        );
      },
    );
  }
}
