import 'package:artus/features/article_list/data/models/article_list_item.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:artus/features/article_list/presentation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:localizations/localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  final component = ArticleListComponentMock();
  final widget = ArticleListView(component);

  setUp(() {
    when(() => component.articles).thenReturn(_mockArticles);
    when(() => component.scrollController).thenReturn(ScrollController());
  });

  Future<void> buildArticleScreenWithTheme(
    ThemeData theme,
    WidgetTester tester,
  ) async {
    final builder = DeviceBuilder(
      wrap: (widget) => Theme(
        data: theme,
        child: Localizations(
          locale: const Locale('ru'),
          delegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          child: widget,
        ),
      ),
    )
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: widget,
        name: 'article list screen',
      );

    await mockNetworkImagesFor(() async => tester.pumpDeviceBuilder(builder));
  }

  testGoldens('Article list screen light', (tester) async {
    await buildArticleScreenWithTheme(AppThemeData.lightTheme, tester);
    await screenMatchesGolden(tester, 'light/article_list_screen');
  });

  testGoldens('Article list screen dark', (tester) async {
    await buildArticleScreenWithTheme(AppThemeData.darkTheme, tester);
    await screenMatchesGolden(tester, 'dark/article_list_screen');
  });
}

class ArticleListComponentMock extends Mock implements ArticleListComponent {}

final _articleMock = ArticleListItem(
  id: 1,
  title: 'Article title',
  description: 'Article desctiption',
  imageUrl: 'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg',
);

final _mockArticles = [
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
  _articleMock,
];
