import 'package:weather_app/app/features/home/interactor/entities/weather_model.dart';

sealed class WeatherState {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  const WeatherInitialState();
}

class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

class WeatherSuccessState extends WeatherState {
  final WeatherEntity weather;

  const WeatherSuccessState(this.weather);
}

class WeatherErrorState extends WeatherState {
  const WeatherErrorState();
}
