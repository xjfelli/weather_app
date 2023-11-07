import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/extensions/http/http_extension.dart';
import 'package:weather_app/app/extensions/http/interceptor/dio_interceptor.dart';
import 'package:weather_app/app/extensions/location/location_extension.dart';
import 'package:weather_app/app/extensions/log/log_extension.dart';
import 'package:weather_app/app/extensions/http/http_impl_extension.dart';
import 'package:weather_app/app/extensions/location/location_impl_extension.dart';
import 'package:weather_app/app/extensions/log/log_impl_extension.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/externals/shared_preferences/shared_preferences_impl.dart';
import 'package:weather_app/app/features/home/home_module.dart';
import 'package:weather_app/app/features/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ISharedPreferences>(SharedPreferencesImpl.new);
    i.addSingleton<LogExtension>(LogImplExtension.new);
    i.addSingleton<Dio>(() => Dio());
    i.addSingleton<CustomInterceptors>(CustomInterceptors.new);
    i.addSingleton<HttpExtension>(HttpImplExtension.new);
    i.add<LocationExtension>(LocationImplExtension.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/home', module: HomeModule());
  }
}
