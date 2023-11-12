import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/core/themes/is_dark_theme.dart';
import 'package:weather_app/app/core/themes/themes.dart';
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
      child: Column(children: [
        Column(
          children: [
            Text(weather.placemark.subAdministrativeArea ?? '',
                style: Theme.of(context).textTheme.headlineMedium),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Text('${weather.currentWeather.temperature2m.ceil()}º',
                  style: Theme.of(context).textTheme.displayLarge!),
            ),
            FutureBuilder(
                future: futureWeatherCode,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              WeatherAdapter.isDay(weather.currentWeather.isDay)
                                  ? snapshot.data!.day.image
                                  : snapshot.data!.night.image,
                          imageBuilder: (context, imageProvider) => SizedBox(
                            height: 40.h,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0.w),
                              child: Row(
                                children: [
                                  Image(image: imageProvider),
                                  Text(
                                    '|   ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(snapshot.data!.day.description),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]);
                }),
          ],
        )
      ]),
    );
  }
}
