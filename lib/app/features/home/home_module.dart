import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/core/configs/bloc/bloc_extension.dart';
import 'package:weather_app/app/core/externals/http/http_extension.dart';
import 'package:weather_app/app/core/externals/location/location_extension.dart';
import 'package:weather_app/app/core/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/features/home/data/home_impl_service.dart';
import 'package:weather_app/app/features/home/UI/home_page.dart';
import 'package:weather_app/app/features/home/interactor/bloc/home_bloc.dart';
import 'package:weather_app/app/features/home/interactor/services/home_service.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<HomeService>(() => HomeImplService(
        httpGateway: Modular.get<HttpExtension>(),
        locationExtension: Modular.get<LocationExtension>(),
        iSharedPreferences: Modular.get<ISharedPreferences>()));
    i.addSingleton<HomeBloc>(
        () => HomeBloc(
            Modular.get<HomeService>(),
            Modular.get<LocationExtension>(),
            Modular.get<ISharedPreferences>()),
        config: blocConfig());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MyHomePage());
  }
}
