import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/features/splash/UI/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
