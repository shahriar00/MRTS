// google_map_page_mobile.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:mrts/modules/my_route/widgets/constant.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final locationController = Location();
  static const Mirpur = LatLng(23.822350, 90.365417);
  static const Motijheel = LatLng(23.733330, 90.417458);

  LatLng? currentPostion;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => await fetchLocationUpdate());
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdate();
    final coordinates = await fetchPolyLinePoint();
    generatePolylinePoints(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPostion == null
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
                  markerId: MarkerId('destionationLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: Motijheel,
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> fetchLocationUpdate() async {
    bool serviceEnable;
    PermissionStatus permissionStatus;
    serviceEnable = await locationController.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await locationController.requestService();
    } else {
      return;
    }

    permissionStatus = await locationController.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await locationController.requestPermission();
    }
    if (permissionStatus != PermissionStatus.granted) {
      return;
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          currentPostion = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }

  Future<List<LatLng>> fetchPolyLinePoint() async {
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(Mirpur.latitude, Mirpur.longitude),
      PointLatLng(Motijheel.latitude, Motijheel.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolylinePoints(List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );
    setState(() => polylines[id] = polyline);
  }
}
