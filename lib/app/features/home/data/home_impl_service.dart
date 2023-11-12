import 'package:weather_app/app/core/externals/location/location_extension.dart';
import 'package:weather_app/app/core/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_current_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_hourly_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_model.dart';
import 'package:weather_app/app/features/home/interactor/states/weather.states.dart';
import 'package:weather_app/app/core/configs/api.dart';

import '../../../core/externals/http/http_extension.dart';

import '../interactor/services/home_service.dart';

class HomeImplService implements HomeService {
  final _defaultParamsURL =
      'current=temperature_2m,is_day,weathercode&hourly=temperature_2m,weathercode';

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
            '${Env.apiEndpoint}/forecast?latitude=${success.position.latitude}&longitude=${success.position.longitude}&$_defaultParamsURL');

        if (response.data.isEmpty) {
          return const WeatherErrorState();
        }

        final weather = WeatherEntity(
            currentWeather:
                WeatherCurrentModel.fromMap(response.data['current']),
            hourly: WeatherHourlyModel.fromMap(response.data['hourly']),
            position: success.position,
            placemark: success.placemark);

        _sharedPreferences.saveString('recent_weather', weather.toJson());

        return WeatherSuccessState(weather);
      }, (failure) {
        return const WeatherErrorState();
      });
    } catch (e) {
      return const WeatherErrorState();
    }
  }
}
