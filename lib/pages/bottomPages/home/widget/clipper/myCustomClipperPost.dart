import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.64, size.height * 0.1);
    path.cubicTo(size.width * 0.64, size.height * 0.1, size.width * 0.38,
        size.height * 0.1, size.width * 0.38, size.height * 0.1);
    path.cubicTo(size.width * 0.17, size.height * 0.1, 0, size.height * 0.14, 0,
        size.height / 5);
    path.cubicTo(
        0, size.height / 5, 0, size.height * 0.8, 0, size.height * 0.8);
    path.cubicTo(0, size.height * 0.86, size.width * 0.17, size.height * 0.9,
        size.width * 0.38, size.height * 0.9);
    path.cubicTo(size.width * 0.38, size.height * 0.9, size.width * 0.64,
        size.height * 0.9, size.width * 0.64, size.height * 0.9);
    path.cubicTo(size.width * 0.84, size.height * 0.9, size.width,
        size.height * 0.95, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, size.height * 0.05, size.width * 0.84,
        size.height * 0.1, size.width * 0.64, size.height * 0.1);
    path.cubicTo(size.width * 0.64, size.height * 0.1, size.width * 0.64,
        size.height * 0.1, size.width * 0.64, size.height * 0.1);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}