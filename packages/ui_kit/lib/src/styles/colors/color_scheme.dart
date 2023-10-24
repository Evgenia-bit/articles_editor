import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/colors/color_palette.dart';

/// App brand color scheme.
///
/// This extension is in sync with base [ThemeData] and [ColorScheme].
///
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  /// The color of the text on [primary].
  final Color onPrimary;

  /// Secondary branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  ///
  /// Complements [primary] color.
  final Color secondary;

  /// The color of the text on [secondary].
  final Color onSecondary;

  /// Surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surface;

  /// The color of the text on [surface].
  final Color onSurface;

  /// Background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color background;

  /// The color of the text on [background].
  final Color onBackground;

  /// Color of error.
  ///
  /// Commonly used to display errors.
  ///
  /// Can be used as an accent color for text/background of an error message/destructive button.
  final Color error;

  /// The color of the text on [error].
  final Color onError;

  /// Base light theme version.
  const AppColorScheme.light()
      : primary = ColorPalette.apple,
        onPrimary = ColorPalette.white,
        secondary = ColorPalette.bananaYellow,
        onSecondary = ColorPalette.spaceCadet,
        surface = ColorPalette.cultured,
        onSurface = ColorPalette.rhythm,
        background = ColorPalette.white,
        onBackground = ColorPalette.spaceCadet,
        error = ColorPalette.carminePink,
        onError = ColorPalette.white;

  /// Base dark theme version.
  const AppColorScheme.dark()
      : primary = DarkColorPalette.pastelGreen,
        onPrimary = DarkColorPalette.white,
        secondary = DarkColorPalette.shandy,
        onSecondary = DarkColorPalette.pineTree,
        surface = DarkColorPalette.pineTree,
        onSurface = DarkColorPalette.rhythm,
        background = DarkColorPalette.darkGunmetal,
        onBackground = DarkColorPalette.white,
        error = DarkColorPalette.fireEngineRed,
        onError = DarkColorPalette.white;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.onSecondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary:  Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
