import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/mock_places.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../screens/events/events_screen.dart';
import '../../screens/discounts/discounts_screen.dart';
import '../../screens/profile/profile_screen.dart';
import 'place_details_sheet.dart';

class MapScreen extends StatefulWidget {
  final double? centerLatitude;
  final double? centerLongitude;

  const MapScreen({super.key, this.centerLatitude, this.centerLongitude});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _currentIndex = 0;
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  MockPlace? _selectedPlace;
  MockPlace? _currentLocation;

  // Nazarbayev University center coordinates
  CameraPosition get _initialCameraPosition {
    if (widget.centerLatitude != null && widget.centerLongitude != null) {
      return CameraPosition(
        target: LatLng(widget.centerLatitude!, widget.centerLongitude!),
        zoom: 18,
      );
    }
    return const CameraPosition(target: LatLng(51.0908, 71.4186), zoom: 16);
  }

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    // Mock current location (can be changed)
    _currentLocation = MockPlace(
      id: 'current',
      name: 'Current Location',
      description: 'Your current position',
      latitude: 51.0905,
      longitude: 71.4178,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Center on location if provided
    if (widget.centerLatitude != null && widget.centerLongitude != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(widget.centerLatitude!, widget.centerLongitude!),
            18,
          ),
        );
      });
    }
  }

  void _initializeMarkers() {
    _markers = mockPlaces.map((place) {
      return Marker(
        markerId: MarkerId(place.id),
        position: LatLng(place.latitude, place.longitude),
        infoWindow: InfoWindow(title: place.name),
        onTap: () => _showPlaceDetails(place),
      );
    }).toSet();
  }

  void _showPlaceDetails(MockPlace place) {
    setState(() {
      _selectedPlace = place;
    });
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          PlaceDetailsSheet(place: place, onNavigate: () => _drawRoute(place)),
    ).then((_) {
      setState(() {
        _selectedPlace = null;
      });
    });
  }

  void _drawRoute(MockPlace destination) {
    if (_currentLocation == null) return;

    final polyline = Polyline(
      polylineId: const PolylineId('route'),
      points: [
        LatLng(_currentLocation!.latitude, _currentLocation!.longitude),
        LatLng(destination.latitude, destination.longitude),
      ],
      color: Colors.blue,
      width: 5,
    );

    setState(() {
      _polylines = {polyline};
    });

    // Center map on route
    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            _currentLocation!.latitude < destination.latitude
                ? _currentLocation!.latitude
                : destination.latitude,
            _currentLocation!.longitude < destination.longitude
                ? _currentLocation!.longitude
                : destination.longitude,
          ),
          northeast: LatLng(
            _currentLocation!.latitude > destination.latitude
                ? _currentLocation!.latitude
                : destination.latitude,
            _currentLocation!.longitude > destination.longitude
                ? _currentLocation!.longitude
                : destination.longitude,
          ),
        ),
        100.0,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onBottomNavTap(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Already on map
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const EventsScreen()),
        );
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DiscountsScreen()),
        );
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex != 0) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        polylines: _polylines,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Buildings'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: mockPlaces.length,
            itemBuilder: (context, index) {
              final place = mockPlaces[index];
              return ListTile(
                title: Text(place.name),
                subtitle: Text(place.description),
                onTap: () {
                  Navigator.of(context).pop();
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLngZoom(
                      LatLng(place.latitude, place.longitude),
                      18,
                    ),
                  );
                  _showPlaceDetails(place);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
