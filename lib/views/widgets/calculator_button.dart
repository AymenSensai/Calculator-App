import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onClick;
  final EdgeInsetsGeometry? padding;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onClick,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        padding: padding ?? const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.normal,
              color: textColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
