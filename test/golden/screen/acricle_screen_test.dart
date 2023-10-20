import 'package:artus/features/article/data/article_repository.dart';
import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Article screen', (tester) async {
    final repository = ArticleRepository(articleId: 1);
    final widget = ArticleWidgetComponent(getArticleBlocksUseCase: repository);

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: widget,
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'article_screen');
  });
}
