import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  regular14(TextStyle(fontSize: 14)),
  regular16(TextStyle(fontSize: 16)),

  bold16(TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
  bold18(TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
  bold24(TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
  bold30(TextStyle(fontSize: 30, fontWeight: FontWeight.w700));

  final TextStyle value;

  const AppTextStyle(this.value);
}
