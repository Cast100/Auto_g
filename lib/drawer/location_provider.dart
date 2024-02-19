import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {
  late final double latitude;
  late final double longitude;
  bool permissionAllowed = false;
  late String selectedAddress = '';
  late bool serviceEnabled;

  Future<void> getCurrentPositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    if (position != null) {
      latitude = position.latitude;
      longitude = position.longitude;
      permissionAllowed = true;

      notifyListeners();
    } else {
      print('Permission not allowed');
    }
    /*bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    notifyListeners();*/
  }

  void onCameraMove(CameraPosition currentposition) async {
    latitude = currentposition.target.latitude;
    longitude = currentposition.target.longitude;

    notifyListeners();
  }

  Future<void> getMoveCamera() async {
    //final coordinates = new Coordinates(latitude, longitude);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
  }
}
