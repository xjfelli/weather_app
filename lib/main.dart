import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/app_module.dart';
import 'package:weather_app/app/app_widget.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await SharedPreferences.getInstance();
  runApp(ModularApp(
      module: AppModule(), child: AppWidget(savedThemeMode: savedThemeMode)));
}
