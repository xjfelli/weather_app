import 'package:weather_app/app/features/interactor/states/weather.states.dart';

abstract class HomeService {
  Future<WeatherState> getWeather();
}
