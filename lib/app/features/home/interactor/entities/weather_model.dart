// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_current_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_hourly_model.dart';

class WeatherEntity {
  final WeatherCurrentModel currentWeather;
  final WeatherHourlyModel hourly;
  final Position position;
  final Placemark placemark;
  WeatherEntity({
    required this.currentWeather,
    required this.position,
    required this.placemark,
    required this.hourly,
  });

  WeatherEntity copyWith({
    WeatherCurrentModel? currentWeather,
    WeatherHourlyModel? hourly,
    Position? position,
    Placemark? placemark,
  }) {
    return WeatherEntity(
        currentWeather: currentWeather ?? this.currentWeather,
        position: position ?? this.position,
        placemark: placemark ?? this.placemark,
        hourly: hourly ?? this.hourly);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current': currentWeather.toMap(),
      'hourly': hourly.toMap(),
      'position': position,
      'placemark': placemark
    };
  }

  factory WeatherEntity.fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      currentWeather:
          WeatherCurrentModel.fromMap(map['current'] as Map<String, dynamic>),
      hourly: WeatherHourlyModel.fromMap(map['hourly'] as Map<String, dynamic>),
      position: Position.fromMap(map['position'] as Map<String, dynamic>),
      placemark: Placemark.fromMap(map['placemark'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherEntity.fromJson(String source) =>
      WeatherEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeatherEntity(current: $currentWeather, hourly: $hourly ,position: $position, placemark: $placemark)';

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.currentWeather == currentWeather &&
        other.hourly == hourly &&
        other.position == position &&
        other.placemark == placemark;
  }

  @override
  int get hashCode =>
      hourly.hashCode ^
      currentWeather.hashCode ^
      position.hashCode ^
      placemark.hashCode;
}
