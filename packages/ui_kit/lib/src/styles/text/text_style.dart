import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  titleLarge(TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
  titleSmall(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),

  headlineLarge(TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
  headlineMedium(TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
  headlineSmall(TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),

  body(TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
  label(TextStyle(fontSize: 16, fontWeight: FontWeight.w600));

  final TextStyle value;

  const AppTextStyle(this.value);
}
