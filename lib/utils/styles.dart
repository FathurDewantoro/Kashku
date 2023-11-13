import 'package:flutter/material.dart';

import 'color.dart';

TextStyle HeaderText() {
  return const TextStyle(
      fontWeight: FontWeight.w600, fontSize: 24, color: BLACK);
}

TextStyle TextBodyGray() {
  return const TextStyle(color: GRAY, fontWeight: FontWeight.w400);
}

TextStyle TextHeadLineSmall(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 36 / 28,
  );
}

TextStyle TextHeadlineMedium(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 36 / 28,
  );
}

TextStyle TextHeadlineLarge(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 40 / 32,
  );
}

TextStyle TextHeadingSmall(Color color) {
  return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.1);
}

TextStyle TextTitleLarge(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 28 / 22,
  );
}

TextStyle TextTitleMedium(Color color) {
  return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.1);
}

TextStyle TextTitleSmall(Color color) {
  return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1);
}

TextStyle TextBodySmall(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: color);
}

TextStyle TextBodyMedium(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: color);
}

TextStyle TextBodyLarge(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: color);
}

TextStyle TextButtonCustom(Color color) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
  );
}

//Box Decoration
BoxShadow containerBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 0.5),
    blurRadius: 0.5,
    spreadRadius: 0,
  );
}

BoxDecoration whiteContainerShadow() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [containerBoxShadow()],
  );
}

BoxDecoration decorationBorder(double borderRadius) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: BORDERCOLOR, width: 1));
}
