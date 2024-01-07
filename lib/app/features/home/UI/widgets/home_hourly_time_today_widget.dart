import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/core/utils/helper.dart';
import 'package:weather_app/app/features/home/adapter/weather_adapter.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_code_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_model.dart';

class HomeHourlyTimeTodayListWidget extends StatelessWidget {
  final WeatherEntity weather;

  const HomeHourlyTimeTodayListWidget({super.key, required this.weather});

  Future<WeatherCodeModel?> getWeatherCode({int? code}) async {
    return WeatherAdapter.wmoDescription(code: code);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemCount: weather.hourly.timeToday.length,
        itemBuilder: (context, index) {
          final time = weather.hourly.timeToday[index];
          final weathercode = weather.hourly.weathercode[index];
          final temperature = weather.hourly.temperature2M[index].ceil();
          return Container(
            width: 50.w,
            height: 100.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: FutureBuilder(
                future: getWeatherCode(code: weathercode),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

                  return CachedNetworkImage(
                      imageUrl:
                          WeatherAdapter.isDay(weather.currentWeather.isDay)
                              ? snapshot.data!.day.image
                              : snapshot.data!.night.image,
                      imageBuilder: (context, imageProvider) => Column(
                            children: [
                              Text('${temperature.toString()}º'),
                              SizedBox(
                                height: 2.h,
                              ),
                              Image(
                                image: imageProvider,
                              ),
                              Text(Helper.formatDatetimeHHMM(time)),
                            ],
                          ));
                }),
          );
        });
  }
}
