import 'package:calculator_app/controller/calculate_controller.dart';
import 'package:calculator_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

Widget outPutSection(
    ThemeController themeController, CalculateController controller) {
  return GetBuilder<CalculateController>(builder: (context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              controller.userInput,
              style: GoogleFonts.spaceGrotesk(
                  color: themeController.isDark ? Colors.white : Colors.black,
                  fontSize: 18),
            ),
            Text(
              controller.userOutput,
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.bold,
                color: themeController.isDark ? Colors.white : Colors.black,
                fontSize: 42,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
