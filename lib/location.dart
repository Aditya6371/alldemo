import 'package:alldemo/widget/drawer.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class locationManager {
//   Location location = Location();

//   Future<bool> getPermission() async {
//     final permission = await location.requestPermission();
//     return permission == PermissionStatus.granted;
//   }
// }

class MapDemo extends StatefulWidget {
  const MapDemo({super.key});

  @override
  State<MapDemo> createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {
  Position? _currentLocation;
  bool servicePermission = false;
  late LocationPermission permission;
  late var address;

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();

    if (!servicePermission) {
      print("Service Denied");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Get Location",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Get Location",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            _currentLocation != null
                ? Container(
                    child: Column(
                      children: [
                        Text(
                          "Latitude: ${_currentLocation?.latitude}",
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Longitude: ${_currentLocation?.longitude}",
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: const Text("Location Null"),
                  ),
            ElevatedButton(
                onPressed: () async {
                  var loc = await _getCurrentLocation();
                  setState(() {
                    _currentLocation = loc;
                  });
                },
                child: const Text("Get Location"))
          ],
        ),
      ),
    );
  }
}
