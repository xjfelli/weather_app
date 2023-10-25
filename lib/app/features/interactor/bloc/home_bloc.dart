import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/extensions/location/location_extension.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/features/interactor/entities/weather_model.dart';
import 'package:weather_app/app/features/interactor/events/weather_event.dart';
import 'package:weather_app/app/features/interactor/services/home_service.dart';
import 'package:weather_app/app/features/interactor/states/weather.states.dart';

class HomeBloc extends Bloc<WeatherEvent, WeatherState> {
  final HomeService service;
  final LocationExtension location;
  final ISharedPreferences _sharedPreferences;

  HomeBloc(this.service, this.location, this._sharedPreferences)
      : super(const WeatherInitialState()) {
    on<WeatherGetDataFromRemoteEvent>(_weatherGetDataEvent);
    on<WeatherGetDataFromStorage>(_weatherGetDataFromStorage);
  }

  void _weatherGetDataEvent(WeatherGetDataFromRemoteEvent event, emit) async {
    emit(const WeatherLoadingState());
    final newState = await service.getWeather();
    emit(newState);
  }

  void _weatherGetDataFromStorage(WeatherGetDataFromStorage event, emit) async {
    final storage = await _sharedPreferences.getString('recent_weather');
    storage.fold((success) {
      emit(WeatherSuccessState(WeatherEntity.fromMap(jsonDecode(success))));
    }, (failure) => null);
  }
}
