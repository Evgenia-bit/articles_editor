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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ArticleWidgetComponent(
        getArticleIdUseCase: repository,
        loadArticleUseCase: repository,
      ),
    );
  }
}
