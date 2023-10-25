import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:weather_app/app/features/interactor/entities/weather_code_model.dart';

class WeatherAdapter {
  static Future<WeatherCodeModel?> wmoDescription({int? code}) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/weathercodes.json');
      final data = jsonDecode(jsonString);

      print(code);
      final weathercode = WeatherCodeModel.fromMap(data[code.toString()]);

      return weathercode;
    } catch (e) {
      return null;
    }
  }
}
