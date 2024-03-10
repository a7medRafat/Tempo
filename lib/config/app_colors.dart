import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppColors {
  static Color primaryColor = Colors.white;
  static Color appColor = const Color(0xFF009DF8);
  static Color thirdColor = Colors.yellow;
  static Color appBarColor = Colors.transparent;
  static Color appBackground = const Color(0xFF030317);

  static Color containerColor = const Color(0xff00A1FF);
  static Color glowColor = const Color(0xff00A1FF).withOpacity(0.5);

  static Gradient stroColor = LinearGradient(
    colors: [
      Colors.blue.withOpacity(0.4),
      Colors.blue.withOpacity(0.2),
      Colors.blue.withOpacity(0.1)
    ],
    stops: const [0.0, 0.3, 0.6],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
