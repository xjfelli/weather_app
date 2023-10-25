import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/app/extensions/location/location_extension.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/features/interactor/entities/weather_model.dart';
import 'package:weather_app/app/features/interactor/states/weather.states.dart';

import '../../extensions/http/http_extension.dart';

import '../interactor/services/home_service.dart';

class HomeImplService implements HomeService {
  final String? _baseAPI = dotenv.env['BASE_API'];
  final _defaultParamsURL = 'current=temperature_2m,weathercode';

  final HttpExtension _httpExtension;
  final LocationExtension _locationExtension;
  final ISharedPreferences _sharedPreferences;

  HomeImplService(
      {required HttpExtension httpGateway,
      required LocationExtension locationExtension,
      required ISharedPreferences iSharedPreferences})
      : _httpExtension = httpGateway,
        _locationExtension = locationExtension,
        _sharedPreferences = iSharedPreferences;

  @override
  Future<WeatherState> getWeather() async {
    try {
      final getCoordinates = await _locationExtension.determinePosition();

      return getCoordinates.fold((success) async {
        final response = await _httpExtension.get(
            '${_baseAPI!}/forecast?latitude=${success.position.latitude}&longitude=${success.position.longitude}&$_defaultParamsURL');

        if (response.data.isEmpty) {
          return const WeatherErrorState();
        }

        final weather = WeatherEntity(
            current: Current.fromMap(response.data['current']),
            position: success.position,
            placemark: success.placemark);

        _sharedPreferences.saveString('recent_weather', weather.toJson());

        return WeatherSuccessState(weather);
      }, (failure) {
        print(failure);
        return const WeatherErrorState();
      });
    } catch (e) {
      print(e);

      return const WeatherErrorState();
    }
  }
}
