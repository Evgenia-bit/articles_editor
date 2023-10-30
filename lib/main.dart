import 'package:api/api.dart';
import 'package:artus/features/article/data/article_repository.dart';
import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:mapper/mapper.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO(Evgenia-bit): add DI
    final repository = ArticleRepository(
      articleId: 1,
      api: ArticlesApiStub(),
      mapper: Mapper(blockParser: BlockParser()),
    );

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Counter',
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      home: ArticleWidgetComponent(loadArticleUseCase: repository),
    );
  }
}
