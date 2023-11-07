// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherCodeModel {
  Day day;
  Day night;
  WeatherCodeModel({
    required this.day,
    required this.night,
  });

  WeatherCodeModel copyWith({
    Day? day,
    Day? night,
  }) {
    return WeatherCodeModel(
      day: day ?? this.day,
      night: night ?? this.night,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day.toMap(),
      'night': night.toMap(),
    };
  }

  factory WeatherCodeModel.fromMap(Map<String, dynamic> map) {
    return WeatherCodeModel(
      day: Day.fromMap(map['day'] as Map<String, dynamic>),
      night: Day.fromMap(map['night'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherCodeModel.fromJson(String source) =>
      WeatherCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeatherCodeModel(day: $day, night: $night)';

  @override
  bool operator ==(covariant WeatherCodeModel other) {
    if (identical(this, other)) return true;

    return other.day == day && other.night == night;
  }

  @override
  int get hashCode => day.hashCode ^ night.hashCode;
}

class Day {
  String description;
  String image;
  Day({
    required this.description,
    required this.image,
  });

  Day copyWith({
    String? description,
    String? image,
  }) {
    return Day(
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'image': image,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Day.fromJson(String source) =>
      Day.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Day(description: $description, image: $image)';

  @override
  bool operator ==(covariant Day other) {
    if (identical(this, other)) return true;

    return other.description == description && other.image == image;
  }

  @override
  int get hashCode => description.hashCode ^ image.hashCode;
}
