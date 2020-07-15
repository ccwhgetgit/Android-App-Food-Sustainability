import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFF004F80);
  static const Color loginGradientEnd = const Color(0xFF03E47B);

  static const Color buttonGradientStart =
      const Color.fromRGBO(36, 59, 85, 1.0);
  static const Color buttonGradientEnd =
      const Color.fromRGBO(104, 178, 160, 0.8);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
