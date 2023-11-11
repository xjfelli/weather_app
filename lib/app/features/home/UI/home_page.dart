import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/features/home/adapter/weather_adapter.dart';
import 'package:weather_app/app/features/home/UI/widgets/home_header_widget.dart';
import 'package:weather_app/app/features/home/UI/widgets/home_hourly_time_widget.dart';
import 'package:weather_app/app/features/home/interactor/bloc/home_bloc.dart';
import 'package:weather_app/app/features/home/interactor/entities/weather_code_model.dart';
import 'package:weather_app/app/features/home/interactor/events/weather_event.dart';
import 'package:weather_app/app/features/home/interactor/states/weather.states.dart';
import 'package:weather_app/app/utils/api.dart';
import 'package:weather_app/app/widgets/app_appbar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherCodeModel?> getWeatherCode({int? code}) async {
    return WeatherAdapter.wmoDescription(code: code);
  }

  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(const WeatherGetDataFromStorage());
    context.read<HomeBloc>().add(const WeatherGetDataFromRemoteEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeBloc>();
    final state = bloc.state;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppAppBarWidget(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: [
          Container(
            height: 1.sh,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(children: [
            SizedBox(
              height: 0.14.sh,
            ),
            if (state is WeatherSuccessState)
              Column(
                children: [
                  HomeHeaderWidget(
                    weather: state.weather,
                    futureWeatherCode: getWeatherCode(
                        code: state.weather.currentWeather.weatherCode),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Clima de hora em hora',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey[300]),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 100.h,
                    child: HomeHourlyTimeListWidget(weather: state.weather),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(Env.apiEndpoint)
                ],
              )
          ])
        ]),
      ),
    );
  }
}
