import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/features/adapter/weather_adapter.dart';
import 'package:weather_app/app/features/interactor/bloc/home_bloc.dart';
import 'package:weather_app/app/features/interactor/entities/weather_code_model.dart';
import 'package:weather_app/app/features/interactor/events/weather_event.dart';
import 'package:weather_app/app/features/interactor/states/weather.states.dart';

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
    print(state);

    final isInitial = state is WeatherInitialState;
    final isSuccess = state is WeatherSuccessState;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: [
          Container(
            height: 1.sh,
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Column(children: [
            SizedBox(
              height: 0.14.sh,
            ),
            SizedBox(
              width: 1.sw,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isInitial)
                        const Text(
                          '--',
                          style: TextStyle(color: Colors.black),
                        ),
                    ],
                  ),
                  if (isSuccess)
                    Column(
                      children: [
                        Text('${state.weather.placemark.subAdministrativeArea}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.black)),
                        Text(
                            '${state.weather.current.temperature2m!.ceil().toString()}º',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.black)),
                        FutureBuilder(
                            future: getWeatherCode(
                                code: state.weather.current.weatherCode),
                            builder: (context, snapshot) {
                              print('snapshot $snapshot');
                              if (!snapshot.hasData) {
                                return const Text('no data');
                              }

                              return Text(snapshot.data!.day.description);
                            }),
                      ],
                    ),
                ],
              ),
            )
          ])
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text showText(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(color: Colors.black),
    );
  }
}
