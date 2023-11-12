import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/core/externals/location/location_extension.dart';
import 'package:weather_app/app/core/themes/themes.dart';

class AppWidget extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const AppWidget({super.key, this.savedThemeMode});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final location = Modular.get<LocationExtension>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, dark) => MaterialApp.router(
          title: 'My Smart App',
          theme: theme,
          darkTheme: dark,
          routerConfig: Modular.routerConfig,
        ),
      ),
    ); //added by extension
  }
}
