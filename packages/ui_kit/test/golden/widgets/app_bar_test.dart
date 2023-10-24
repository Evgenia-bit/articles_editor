import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  testGoldens('App bar without leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        const CustomAppBar(
          title: 'Test',
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'app_bar_without_leading');
  });

  testGoldens('App bar with leading', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'AppBar',
        const CustomAppBar(
          title: 'Test',
          automaticallyImplyLeading: true,
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'app_bar_with_leading');
  });
}
