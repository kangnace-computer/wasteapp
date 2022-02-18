// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_import

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LocationData currntPosition;
  late GoogleMapController mapController;
  Location location = Location();
  LatLng initialcameraposition = LatLng(13.817874838249228, 100.51185835295483);

  late Marker marker;
  List<Marker> markers = <Marker>[];

  String myLocation = "no";
  late BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Location Point'),
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pop(context, initialcameraposition);
                    print(
                        "Save ${initialcameraposition.longitude} : ${initialcameraposition.latitude}");
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: initialcameraposition, zoom: 5),
        markers: Set<Marker>.of(markers),
        mapType: MapType.hybrid,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getLoc,
        label: Text('me'),
        icon: Icon(Icons.near_me),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    print(
        "oncreted ${initialcameraposition.longitude} : ${initialcameraposition.latitude}");
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: initialcameraposition, zoom: 12),
      ),
    );
  }

  getLoc() async {
    myLocation = "Yes";
    print("MyLocation $myLocation");
    bool _servicaEnbled;
    PermissionStatus _permissionGranted;

    _servicaEnbled = await location.serviceEnabled();
    if (!_servicaEnbled) {
      _servicaEnbled = await location.requestService();
      if (!_servicaEnbled) {
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
    currntPosition = await location.getLocation();
    double? latitude = currntPosition.latitude;
    double? longitude = currntPosition.longitude;

    location.onLocationChanged.listen((LocationData) {
      setState(() {
        print(
            "Curren loc ${initialcameraposition.longitude} : ${initialcameraposition.latitude}");
        initialcameraposition = LatLng(latitude!, longitude!);
        mapController
            .moveCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
      });
    });
  }
}
