import 'dart:convert';

class WeatherCurrentModel {
  String time;
  int interval;
  double temperature2m;
  int weatherCode;
  int isDay;

  WeatherCurrentModel({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.isDay,
    required this.weatherCode,
  });

  String get temperature2mToString => temperature2m.ceil().toString();

  WeatherCurrentModel copyWith({
    String? time,
    int? interval,
    double? temperature2m,
    int? isDay,
    int? weatherCode,
  }) {
    return WeatherCurrentModel(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        temperature2m: temperature2m ?? this.temperature2m,
        weatherCode: weatherCode ?? this.weatherCode,
        isDay: isDay ?? this.isDay);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'interval': interval,
      'temperature_2m': temperature2m,
      'weathercode': weatherCode,
      'is_day': isDay
    };
  }

  factory WeatherCurrentModel.fromMap(Map<String, dynamic> map) {
    return WeatherCurrentModel(
        time: map['time'] as String,
        interval: map['interval'] as int,
        temperature2m: map['temperature_2m'] as double,
        isDay: map["is_day"] as int,
        weatherCode: map['weathercode'] as int);
  }

  String toJson() => json.encode(toMap());

  factory WeatherCurrentModel.fromJson(String source) =>
      WeatherCurrentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Current(time: $time, interval: $interval, temperature2m: $temperature2m)';

  @override
  bool operator ==(covariant WeatherCurrentModel other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.interval == interval &&
        other.temperature2m == temperature2m;
  }

  @override
  int get hashCode =>
      time.hashCode ^ interval.hashCode ^ temperature2m.hashCode;
}
