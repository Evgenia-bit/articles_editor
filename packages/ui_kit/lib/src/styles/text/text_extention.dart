import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 14.
  final TextStyle regular14;

  /// Text style 16.
  final TextStyle regular16;

  /// Text style 16_700.
  final TextStyle bold16;

  /// Text style 18_700.
  final TextStyle bold18;

  /// Text style 24_700.
  final TextStyle bold24;

  /// Text style 30_700.
  final TextStyle bold30;

  AppTextTheme._({
    required this.regular14,
    required this.regular16,
    required this.bold16,
    required this.bold18,
    required this.bold24,
    required this.bold30,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular14 = AppTextStyle.regular14.value,
        regular16 = AppTextStyle.regular16.value,
        bold16 = AppTextStyle.bold16.value,
        bold18 = AppTextStyle.bold18.value,
        bold24 = AppTextStyle.bold24.value,
        bold30 = AppTextStyle.bold30.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold24: TextStyle.lerp(bold24, other.bold24, t)!,
      bold30: TextStyle.lerp(bold30, other.bold30, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? bold16,
    TextStyle? bold18,
    TextStyle? bold24,
    TextStyle? bold30,
  }) {
    return AppTextTheme._(
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      bold16: bold16 ?? this.bold16,
      bold18: bold18 ?? this.bold18,
      bold24: bold24 ?? this.bold24,
      bold30: bold30 ?? this.bold30,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
