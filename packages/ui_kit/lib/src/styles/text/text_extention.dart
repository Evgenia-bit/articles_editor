import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 26_700.
  final TextStyle headlineLarge;

  /// Text style 22_700.
  final TextStyle headlineMedium;

  /// Text style 18_700.
  final TextStyle headlineSmall;

  /// Text style 14_400.
  final TextStyle body;

  /// Text style 16_600.
  final TextStyle label;

  AppTextTheme._({
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.body,
    required this.label,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : headlineLarge = AppTextStyle.headlineLarge.value,
        headlineMedium = AppTextStyle.headlineMedium.value,
        headlineSmall = AppTextStyle.headlineSmall.value,
        body = AppTextStyle.body.value,
        label = AppTextStyle.label.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
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
    TextStyle? titleLarge,
    TextStyle? titleSmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? body,
    TextStyle? label,
  }) {
    return AppTextTheme._(
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      body: body ?? this.body,
      label: label ?? this.label,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
