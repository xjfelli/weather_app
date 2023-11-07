import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_code_model.dart';

class WeatherAdapter {
  static Future<WeatherCodeModel?> wmoDescription({int? code}) async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/weathercodes.json');
      final data = jsonDecode(jsonString);

      final weathercode = WeatherCodeModel.fromMap(data[code.toString()]);

      return weathercode;
    } catch (e) {
      return null;
    }
  }

  static bool isDay(int dayCode) {
    if (dayCode == 0) {
      return false;
    }

    return true;
  }
}
