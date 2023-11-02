import 'package:artus/features/article/domain/models/article.dart';
import 'package:artus/features/article/domain/models/article_state.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mapper/mapper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  final component = ArticleComponentMock();
  final widget = ArticleView(component);

  setUp(() {
    when(() => component.articleState).thenReturn(
      ArticleStateData(article: _articleMock),
    );
  });

  Future<void> buildArticleScreenWithTheme(
    ThemeData theme,
    WidgetTester tester,
  ) async {
    final builder = DeviceBuilder(
      wrap: (widget) => Theme(
        data: theme,
        child: widget,
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
        name: 'article screen',
      );

    await tester.pumpDeviceBuilder(builder);
  }

  testGoldens('Article screen light', (tester) async {
    await buildArticleScreenWithTheme(AppThemeData.lightTheme, tester);
    await screenMatchesGolden(tester, 'light/article_screen');
  });

  testGoldens('Article screen dark', (tester) async {
    await buildArticleScreenWithTheme(AppThemeData.darkTheme, tester);
    await screenMatchesGolden(tester, 'dark/article_screen');
  });
}

class ArticleComponentMock extends Mock implements ArticleComponent {}

final _articleMock = Article(title: 'Test title', blocks: [
  HeadingBlock(
    CustomHeadingBlockModel.fromJson(
      {
        'text': 'Heading 1',
        'level': 1,
      },
    ),
  ),
  HeadingBlock(
    CustomHeadingBlockModel.fromJson(
      {
        'text': 'Heading 2',
        'level': 2,
      },
    ),
  ),
  HeadingBlock(
    CustomHeadingBlockModel.fromJson(
      {
        'text': 'Heading 3',
        'level': 2,
      },
    ),
  ),
  ParagraphBlock(
    CustomParagraphBlockModel.fromJson(
      {
        'children': [
          {
            'text':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            'style': {
              'is_bold': false,
              'is_italic': false,
              'is_monospaced': false
            }
          },
          {
            'text':
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
            'style': {
              'is_bold': true,
              'is_italic': false,
              'is_monospaced': false
            }
          },
          {
            'text':
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
            'style': {
              'is_bold': false,
              'is_italic': true,
              'is_monospaced': false
            }
          },
          {
            'text':
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
            'stye': {
              'is_bold': false,
              'is_italic': false,
              'is_monospaced': true
            }
          },
        ]
      },
    ),
  ),
  BulletedListBlock(
    CustomListBlockModel.fromJson(
      {
        'type': 'BULLETED',
        'items': [
          {
            'children': [
              {
                'text':
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              },
            ]
          },
          {
            'children': [
              {
                'text':
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
          {
            'children': [
              {
                'text':
                    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
          {
            'children': [
              {
                'text':
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
        ],
      },
    ),
  ),
  OrderedListBlock(
    CustomListBlockModel.fromJson(
      {
        'type': 'ORDERED',
        'items': [
          {
            'children': [
              {
                'text':
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              },
            ]
          },
          {
            'children': [
              {
                'text':
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
          {
            'children': [
              {
                'text':
                    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
          {
            'children': [
              {
                'text':
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                'style': {
                  'is_bold': false,
                  'is_italic': false,
                  'is_monospaced': false
                }
              }
            ]
          },
        ],
      },
    ),
  )
]);
