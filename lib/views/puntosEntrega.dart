import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiYW50b25pb2NvcmFsMTIiLCJhIjoiY2xub2RzbXB0MGQyNDJva3hnYjQwdXVmYSJ9.bnWZpZND9XoQaydnF8wRaA';

class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _mapaState();
}

class _mapaState extends State<mapa> {
  LatLng? myPosition;

  Future<LatLng> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LatLng(40.697488, -73.979681); // Valor por defecto en caso de error
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    determinePosition().then((position) {
      setState(() {
        myPosition = position;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Elige un punto de retiro'),
        backgroundColor: Colors.yellow,
      ),
      body: myPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: SizedBox(
                height: 450,
                width: 450,
                child: FlutterMap(
                  options: MapOptions(
                    center: myPosition!,
                    minZoom: 5,
                    maxZoom: 25,
                    zoom: 18,
                  ),
                  nonRotatedChildren: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                      additionalOptions: const {
                        'accessToken': MAPBOX_ACCESS_TOKEN,
                        'id': 'mapbox/streets-v12',
                      },
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: myPosition!,
                          builder: (context) {
                            return Container(
                              child: const Icon(
                                Icons.person_pin,
                                color: Colors.blueAccent,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
