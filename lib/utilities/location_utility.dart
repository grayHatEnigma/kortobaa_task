// TODO : un-comment this when we need to add fetch-location feature to the app
/*
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class LocationUtility {
  Coordinates _latLng;
  PermissionStatus _permissionStatus;

  static final instance = LocationUtility._();
  LocationUtility._();
  factory LocationUtility() => instance;

  // *** Getters ***
  Coordinates get currentLocation => _latLng;
  PermissionStatus get permissionStatus => _permissionStatus;

  // *** Helpers ***
  void fetchLocation() async {
    await _fetchUserLocation();

    // print(
    //     'User Latitude  : ${_latLng.latitude} , User Longitude  : ${_latLng.longitude}');
  }

  void checkPermissionStatus() async {
    Location location = Location();
    var permission = await location.hasPermission();
    _permissionStatus = permission;

    print(_permissionStatus);
  }

// ############### ROUTINES #################

  Future<void> _fetchUserLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Getting Location
    _locationData = await location.getLocation();
    _latLng = Coordinates(_locationData.latitude, _locationData.longitude);
  }
}
*/
