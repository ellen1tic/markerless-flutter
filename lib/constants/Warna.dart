import 'package:flutter/material.dart';

// Warna

class Warna {
  static Color biru = Colors.blue;
  static Color biruGelap = Color(0xFF1A237E);
  static Color biruLangit = Color(0xFF90CAF9);

  static var gradientHeader = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF81D4FA),
        Color(0xFF1A237E),
      ],
    ),
  );
}
