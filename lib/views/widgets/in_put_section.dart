import 'package:calculator_app/controller/calculate_controller.dart';
import 'package:calculator_app/controller/theme_controller.dart';
import 'package:calculator_app/core/theming/colors.dart';
import 'package:calculator_app/views/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget inPutSection(
    ThemeController themeController, CalculateController controller) {
  final List<String> buttons = [
    "C",
    "%",
    "DEL",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "00",
    "0",
    ".",
    "=",
  ];

  Color getButtonColor(String buttonText) {
    if (buttonText == "C" || buttonText == "%" || buttonText == "DEL") {
      return ColorsManager.leftOperatorColor;
    } else if (buttonText == "=") {
      return ColorsManager.operatorColor;
    } else {
      return _isOperator(buttonText)
          ? ColorsManager.operatorColor
          : ColorsManager.btnBgColor;
    }
  }

  void onButtonPressed(String buttonText) {
    switch (buttonText) {
      case "C":
        controller.clearInputAndOutput();
        break;
      case "DEL":
        controller.deleteBtnAction();
        break;
      case "=":
        controller.equalPressed();
        break;
      default:
        controller.onBtnTapped(buttons, buttons.indexOf(buttonText));
        break;
    }
  }

  return Container(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    decoration: BoxDecoration(
      color: themeController.isDark
          ? ColorsManager.darkSheetBgColor
          : ColorsManager.lightSheetBgColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: buttons.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return CalculatorButton(
          onClick: () => onButtonPressed(buttons[index]),
          color: getButtonColor(buttons[index]),
          textColor: _isOperator(buttons[index]) ||
                  buttons[index].isNum ||
                  buttons[index] == '.'
              ? Colors.white
              : (ColorsManager.btnBgColor),
          text: buttons[index],
        );
      },
    ),
  );
}

bool _isOperator(String y) {
  if (y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
    return true;
  }
  return false;
}
