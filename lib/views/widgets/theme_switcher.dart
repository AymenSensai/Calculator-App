import 'package:calculator_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget themeSwitcher(ThemeController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, top: 32.0, bottom: 8),
    child: IconButton(
      onPressed: () =>
          controller.isDark ? controller.lightTheme() : controller.darkTheme(),
      icon: SvgPicture.asset(
          controller.isDark ? 'assets/sun.svg' : 'assets/moon.svg'),
    ),
  );
}
