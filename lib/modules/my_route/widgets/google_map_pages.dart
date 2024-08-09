import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrts/modules/my_route/widgets/constant.dart'; 
import 'dart:async';

class GoogleMapPageData extends StatefulWidget {
  const GoogleMapPageData({super.key});

  @override
  State<GoogleMapPageData> createState() => _GoogleMapPageDataState();
}

class _GoogleMapPageDataState extends State<GoogleMapPageData> {
  final locationController = Location();
  static const Mirpur = LatLng(23.822350, 90.365417);
  static const Farmgate = LatLng(23.7561, 90.3872);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("Initializing map...");
      await initializeMap();
    });
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdate();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: Mirpur,
                zoom: 13,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: Mirpur,
                ),
                const Marker(
                  markerId: MarkerId('destinationLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: Farmgate,
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> fetchLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      print("Service not enabled. Requesting service...");
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) {
        print("Service not enabled. Exiting...");
        return;
      }
    }

    permissionStatus = await locationController.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      print("Permission denied. Requesting permission...");
      permissionStatus = await locationController.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        print("Permission not granted. Exiting...");
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        print("Current location: ${currentLocation.latitude}, ${currentLocation.longitude}");
        setState(() {
          currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(Mirpur.latitude, Mirpur.longitude),
      PointLatLng(Farmgate.latitude, Farmgate.longitude),
    );

    if (result.points.isNotEmpty) {
      print('Fetched polyline points: ${result.points}');
      return result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
    } else {
      print('Error fetching polyline points: ${result.errorMessage}');
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    if (polylineCoordinates.isEmpty) {
      print('No polyline coordinates to generate polyline.');
      return;
    }

    const id = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() {
      polylines[id] = polyline;
    });

    print('Polyline generated with ${polylineCoordinates.length} points.');
  }
}
