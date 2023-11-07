import 'package:weather_app/app/features/home/interactor/states/weather.states.dart';

abstract class HomeService {
  Future<WeatherState> getWeather();
}
