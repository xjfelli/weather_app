import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/core/themes/change_theme.dart';
import 'package:weather_app/app/core/themes/is_dark_theme.dart';

class AppAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () => ChangeTheme.call(context),
            splashRadius: 20,
            icon: Icon(
              context.isDark ? Icons.light_mode : Icons.dark_mode,
              size: 30,
              color: context.isDark ? Colors.yellow[600] : Colors.grey[700],
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
