import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wazzi/drawer/location_provider.dart';

class Gridviewgooglemap extends StatefulWidget {
  const Gridviewgooglemap({Key? key}) : super(key: key);
  @override
  _googlemapState createState() => _googlemapState();
}

class _googlemapState extends State<Gridviewgooglemap> {
  late double latitude;
  late double longitude;
  late LatLng currentLocation;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);

    setState(() {
      currentLocation = LatLng(locationData.latitude, locationData.longitude);
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        mapController = controller;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentLocation, zoom: 14.4746),
            zoomControlsEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(1.5, 20.8),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: (CameraPosition position) {
              locationData.onCameraMove(position);
            },
            onMapCreated: onCreated,
            onCameraIdle: () {
              locationData.getMoveCamera();
            },
          ),
        ]),
      ),
    );
  }
}
