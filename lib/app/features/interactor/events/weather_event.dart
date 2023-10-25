sealed class WeatherEvent {}

class WeatherGetDataFromStorage implements WeatherEvent {
  const WeatherGetDataFromStorage();
}

class WeatherGetDataFromRemoteEvent implements WeatherEvent {
  const WeatherGetDataFromRemoteEvent();
}

class WeatherGetDataFromLocalEvent implements WeatherEvent {
  WeatherGetDataFromLocalEvent();
}
