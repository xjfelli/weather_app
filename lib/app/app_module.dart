import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/extensions/bloc/bloc_extension.dart';
import 'package:weather_app/app/extensions/http/http_extension.dart';
import 'package:weather_app/app/extensions/http/interceptor/dio_interceptor.dart';
import 'package:weather_app/app/extensions/location/location_extension.dart';
import 'package:weather_app/app/extensions/log/log_extension.dart';
import 'package:weather_app/app/extensions/http/http_impl_extension.dart';
import 'package:weather_app/app/extensions/location/location_impl_extension.dart';
import 'package:weather_app/app/extensions/log/log_impl_extension.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences_impl.dart';
import 'package:weather_app/app/features/UI/auth_page.dart';
import 'package:weather_app/app/features/data/home_impl_service.dart';
import 'package:weather_app/app/features/interactor/bloc/home_bloc.dart';
import 'package:weather_app/app/features/interactor/services/home_service.dart';
import 'package:weather_app/app/features/UI/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ISharedPreferences>(SharedPreferencesImpl.new);
    i.addSingleton<LogExtension>(LogImplExtension.new);
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<CustomInterceptors>(CustomInterceptors.new);
    i.addSingleton<HttpExtension>(HttpImplExtension.new);
    i.add<LocationExtension>(LocationImplExtension.new);
    i.addSingleton<HomeBloc>(HomeBloc.new, config: blocConfig());
    i.add<HomeService>(HomeImplService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MyHomePage());
    r.child('/auth', child: (context) => const AuthPage());
  }
}
