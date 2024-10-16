import 'package:flutter/material.dart';
import 'package:map_course/widgets/google_map_widget.dart';

void main() {
  runApp(const GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GoogleMapWidget(),
    );
  }
}
