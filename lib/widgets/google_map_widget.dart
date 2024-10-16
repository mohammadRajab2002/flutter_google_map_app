import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_course/models/place_model.dart';
import 'dart:ui' as ui;

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;
  @override
  void initState() {
    cameraPosition = const CameraPosition(target: LatLng(31, 25), zoom: 12);
    super.initState();
    initMarkers();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                mapController.animateCamera(
                    CameraUpdate.newLatLng(const LatLng(20, 20)));
              },
              child: const Text("update location"))
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: markers,
        initialCameraPosition: cameraPosition,
        onMapCreated: (controller) {
          mapController = controller;
          initMapStyle();
        },
      ),
    );
  }

  Future<Uint8List> getImageFromRowData({
    required String image,
    required double width,
  }) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
      imageData.buffer.asUint8List(),
      targetWidth: width.round(),
    );
    var imageframe = await imageCodec.getNextFrame();
    var imageByteData =
        await imageframe.image.toByteData(format: ui.ImageByteFormat.png);
    return imageByteData!.buffer.asUint8List();
  }

  initMapStyle() async {
    var myMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/google_map_styles/night_style.json");
    mapController.setMapStyle(myMapStyle);
  }

  void initMarkers() async {
    var customMarkerIcon = BitmapDescriptor.bytes(
      await getImageFromRowData(image: "assets/images/marker.png", width: 100),
    );
    var myMarkers = places.map(
      (placeModel) => Marker(
        icon: customMarkerIcon,
        markerId: MarkerId(placeModel.id.toString()),
        position: placeModel.latLng,
        infoWindow: InfoWindow(
          title: placeModel.name,
        ),
      ),
    );
    markers.addAll(myMarkers);
    setState(() {});
  }
}
