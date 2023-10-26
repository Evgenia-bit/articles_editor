import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  headlineLarge(TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  )),
  headlineMedium(TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  )),
  headlineSmall(TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  )),

  body(TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  )),
  label(TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
