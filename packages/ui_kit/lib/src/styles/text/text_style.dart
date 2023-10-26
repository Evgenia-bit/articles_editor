import 'package:flutter/material.dart';

const _fontFamily = 'Roboto';

/// App text style.
enum AppTextStyle {
  headlineLarge(TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontFamily: _fontFamily,
  )),
  headlineMedium(TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontFamily: _fontFamily,
  )),
  headlineSmall(TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontFamily: _fontFamily,
  )),

  body(TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontFamily: _fontFamily,
  )),
  label(TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    fontFamily: _fontFamily,
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
