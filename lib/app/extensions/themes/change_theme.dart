import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/app/extensions/themes/is_dark_theme.dart';

class ChangeTheme {
  static void call(BuildContext context) {
    if (context.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }
}
