// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherEntity {
  final Current current;
  final Position position;
  final Placemark placemark;
  WeatherEntity({
    required this.current,
    required this.position,
    required this.placemark,
  });

  WeatherEntity copyWith({
    Current? current,
    Position? position,
    Placemark? placemark,
  }) {
    return WeatherEntity(
      current: current ?? this.current,
      position: position ?? this.position,
      placemark: placemark ?? this.placemark,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current': current.toMap(),
      'position': position,
      'placemark': placemark
    };
  }

  factory WeatherEntity.fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      current: Current.fromMap(map['current'] as Map<String, dynamic>),
      position: Position.fromMap(map['position'] as Map<String, dynamic>),
      placemark: Placemark.fromMap(map['placemark'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherEntity.fromJson(String source) =>
      WeatherEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeatherEntity(current: $current, position: $position, placemark: $placemark)';

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.current == current &&
        other.position == position &&
        other.placemark == placemark;
  }

  @override
  int get hashCode => current.hashCode ^ position.hashCode ^ placemark.hashCode;
}

class Current {
  String? time;
  int? interval;
  double? temperature2m;
  int weatherCode;

  Current({
    this.time,
    this.interval,
    this.temperature2m,
    required this.weatherCode,
  });

  Current copyWith({
    String? time,
    int? interval,
    double? temperature2m,
  }) {
    return Current(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature2m: temperature2m ?? this.temperature2m,
        weatherCode: weatherCode);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'interval': interval,
      'temperature_2m': temperature2m,
      'weathercode': weatherCode
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
        time: map['time'] != null ? map['time'] as String : null,
        interval: map['interval'] != null ? map['interval'] as int : null,
        temperature2m: map['temperature_2m'] != null
            ? map['temperature_2m'] as double
            : null,
        weatherCode: map['weathercode'] as int);
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Current(time: $time, interval: $interval, temperature2m: $temperature2m)';

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.interval == interval &&
        other.temperature2m == temperature2m;
  }

  @override
  int get hashCode =>
      time.hashCode ^ interval.hashCode ^ temperature2m.hashCode;
}
