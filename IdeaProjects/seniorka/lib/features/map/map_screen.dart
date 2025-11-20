// lib/features/map/map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  static const _nuCenter = LatLng(51.0899, 71.3980); // NU coords

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Map')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _nuCenter,
          zoom: 16,
        ),
        myLocationEnabled: true,
        onMapCreated: (c) => _controller = c,
      ),
    );
  }
}
