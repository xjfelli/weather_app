import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/extensions/utils/helper.dart';
import 'package:weather_app/app/features/home/adapter/weather_adapter.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_code_model.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_model.dart';

class HomeHourlyTimeListWidget extends StatelessWidget {
  final WeatherEntity weather;

  const HomeHourlyTimeListWidget({super.key, required this.weather});

  Future<WeatherCodeModel?> getWeatherCode({int? code}) async {
    return WeatherAdapter.wmoDescription(code: code);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(left: 13.w),
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
            child: Center(
                child: Column(
              children: [
                Text('${temperature.toString()}º'),
                SizedBox(
                  height: 2.h,
                ),
                FutureBuilder(
                    future: getWeatherCode(code: weathercode),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox();
                      }

                      return Image.network(
                        WeatherAdapter.isDay(weather.currentWeather.isDay)
                            ? snapshot.data!.day.image
                            : snapshot.data!.night.image,
                      );
                    }),
                Text(Helper.formatDatetimeHHMM(time)),
              ],
            )),
          );
        });
  }
}
