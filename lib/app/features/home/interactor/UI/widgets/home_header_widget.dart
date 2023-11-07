import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/features/home/adapter/weather_adapter.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_code_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_model.dart';

class HomeHeaderWidget extends StatelessWidget {
  final Future<WeatherCodeModel?>? futureWeatherCode;
  final WeatherEntity weather;
  const HomeHeaderWidget(
      {super.key, this.futureWeatherCode, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Column(
            children: [
              Text(weather.placemark.subAdministrativeArea ?? '',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('${weather.currentWeather.temperature2m.ceil()}º',
                  style: Theme.of(context).textTheme.displayLarge!),
              FutureBuilder(
                  future: futureWeatherCode,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('no data');
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            WeatherAdapter.isDay(weather.currentWeather.isDay)
                                ? snapshot.data!.day.image
                                : snapshot.data!.night.image,
                            height: 40.h),
                        Text(
                          '|   ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(snapshot.data!.day.description),
                      ],
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
