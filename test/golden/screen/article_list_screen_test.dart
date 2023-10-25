import 'package:api/api.dart';
import 'package:artus/features/article/data/article_repository.dart';
import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:artus/features/article_list/data/models/article_list_item.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:artus/features/article_list/presentation/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final component = ArticleListComponentMock();
  final articleListScreen = ArticleListView(component);

  setUp(() {
    when(() => component.articles).thenReturn(_mockArticles);
    when(() => component.scrollController).thenReturn(ScrollController());
  });

  testGoldens('Article list screen golden test', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: articleListScreen,
        name: 'article list screen',
      );

    await tester.pumpDeviceBuilder(builder);
    await multiScreenGolden(tester, 'article_list_screen');
  });
}

class ArticleListComponentMock extends Mock implements ArticleListComponent {}

final _articleMock = ArticleListItem(
    id: 1,
    title: 'Article title',
    description: 'Article desctiption',
    imageUrl:
        null // 'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg',
    );

final _mockArticles = [
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock
];
