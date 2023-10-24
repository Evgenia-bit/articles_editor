import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  testGoldens('Light app bar without leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        Theme(
          data: AppThemeData.lightTheme,
          child: const CustomAppBar(
            title: 'Test',
          ),
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'light/app_bar_without_leading');
  });

  testGoldens('Light app bar with leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        Theme(
          data: AppThemeData.lightTheme,
          child: const CustomAppBar(
            title: 'Test',
            automaticallyImplyLeading: true,
          ),
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'light/app_bar_with_leading');
  });

  testGoldens('Dark app bar without leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        Theme(
          data: AppThemeData.darkTheme,
          child: const CustomAppBar(
            title: 'Test',
          ),
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'dark/app_bar_without_leading');
  });

  testGoldens('Dark app bar with leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        Theme(
          data: AppThemeData.darkTheme,
          child: const CustomAppBar(
            title: 'Test',
            automaticallyImplyLeading: true,
          ),
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'dark/app_bar_with_leading');
  });
}
