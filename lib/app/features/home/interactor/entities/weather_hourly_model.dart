// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeatherHourlyModel {
  final List<DateTime> time;
  List<double> temperature2M;
  final List<int> weathercode;
  WeatherHourlyModel({
    required this.time,
    required this.temperature2M,
    required this.weathercode,
  });

  List<DateTime> get timeToday {
    List<DateTime> todayDates = [];
    DateTime currentDate = DateTime.now();
    DateTime oneHourBehindDate = DateTime(currentDate.year, currentDate.month,
        currentDate.day, currentDate.hour - 1);

    DateTime nextDate = DateTime(currentDate.year, currentDate.month,
        currentDate.day + 1, currentDate.hour + 1);

    for (var dateStr in time) {
      if (dateStr.isBefore(nextDate) && dateStr.isAfter(oneHourBehindDate)) {
        todayDates.add(dateStr);
      }
    }

    return todayDates;
  }

  WeatherHourlyModel copyWith({
    List<DateTime>? time,
    List<double>? temperature2M,
    List<int>? weathercode,
  }) {
    return WeatherHourlyModel(
      time: time ?? this.time,
      temperature2M: temperature2M ?? this.temperature2M,
      weathercode: weathercode ?? this.weathercode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.map((e) => e.toIso8601String()).toList(),
      'temperature_2m': temperature2M,
      'weathercode': weathercode,
    };
  }

  factory WeatherHourlyModel.fromMap(Map<String, dynamic> map) {
    return WeatherHourlyModel(
        time: List<DateTime>.from(map['time'].map((x) => DateTime.parse(x))),
        temperature2M: List<double>.from(map['temperature_2m'].map((x) => x)),
        weathercode: List<int>.from(
          (map['weathercode'].map((x) => x)),
        ));
  }

  String toJson() => json.encode(toMap());

  factory WeatherHourlyModel.fromJson(String source) =>
      WeatherHourlyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeatherHourlyModel(time: $time, temperature2M: $temperature2M, weathercode: $weathercode)';

  @override
  bool operator ==(covariant WeatherHourlyModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.time, time) &&
        listEquals(other.temperature2M, temperature2M) &&
        listEquals(other.weathercode, weathercode);
  }

  @override
  int get hashCode =>
      time.hashCode ^ temperature2M.hashCode ^ weathercode.hashCode;
}
