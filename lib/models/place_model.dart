import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: 'سوق الحميدية',
    latLng: const LatLng(33.5102, 36.3018),
  ),
  PlaceModel(
    id: 2,
    name: 'الجامع الأموي',
    latLng: const LatLng(33.5116, 36.3064),
  ),
  PlaceModel(
    id: 3,
    name: 'قلعة دمشق',
    latLng: const LatLng(33.5121, 36.3047),
  ),
  PlaceModel(
    id: 4,
    name: 'مقهى النوفرة',
    latLng: const LatLng(33.5112, 36.3080),
  ),
  PlaceModel(
    id: 5,
    name: 'خان أسعد باشا',
    latLng: const LatLng(33.5114, 36.3053),
  ),
];
