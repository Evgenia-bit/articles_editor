import 'package:api/api.dart';
import 'package:artus/features/article/data/article_repository.dart';
import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mapper/mapper.dart';

void main() {
  testGoldens('Article screen', (tester) async {
    final repository = ArticleRepository(
      articleId: 1,
      api: ArticlesApiStub(),
    );
    final widget = ArticleWidgetComponent(
      getArticleIdUseCase: repository,
      loadArticleUseCase: repository,
      mapper: Mapper(
        blockParser: BlockParser(),
      ),
    );

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: widget,
        name: 'article screen',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'article_screen');
  });
}
