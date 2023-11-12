// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationEntity {
  final Position position;
  final Placemark placemark;
  LocationEntity({
    required this.position,
    required this.placemark,
  });

  LocationEntity copyWith({
    Position? position,
    Placemark? placemark,
  }) {
    return LocationEntity(
      position: position ?? this.position,
      placemark: placemark ?? this.placemark,
    );
  }

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      position: Position.fromMap(map['position'] as Map<String, dynamic>),
      placemark: Placemark.fromMap(map['placemark'] as Map<String, dynamic>),
    );
  }

  factory LocationEntity.fromJson(String source) =>
      LocationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LocationEntity(position: $position, placemark: $placemark)';

  @override
  bool operator ==(covariant LocationEntity other) {
    if (identical(this, other)) return true;

    return other.position == position && other.placemark == placemark;
  }

  @override
  int get hashCode => position.hashCode ^ placemark.hashCode;
}
