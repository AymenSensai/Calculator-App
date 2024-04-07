import 'package:calculator_app/controller/calculate_controller.dart';
import 'package:calculator_app/controller/theme_controller.dart';
import 'package:calculator_app/core/theming/colors.dart';
import 'package:calculator_app/views/widgets/in_put_section.dart';
import 'package:calculator_app/views/widgets/out_put_section.dart';
import 'package:calculator_app/views/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? ColorsManager.darkScaffoldBgColor
            : ColorsManager.lightScaffoldBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            themeSwitcher(themeController),
            outPutSection(themeController, controller),
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }
}
