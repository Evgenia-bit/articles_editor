import 'package:artus/features/app/di/app_accembly.dart';
import 'package:artus/features/article_list/data/article_list_repository.dart';
import 'package:artus/features/article_list/di/assembly.dart';
import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:artus/features/article_list/presentation/widget_component.dart';
import 'package:flutter/widgets.dart';

class ArticleListEntry extends StatefulWidget {
  const ArticleListEntry({
    required this.appAssembly,
    super.key,
  });

  final IAppAssembly appAssembly;

  @override
  State<ArticleListEntry> createState() => _ArticleListEntryState();
}

class _ArticleListEntryState extends State<ArticleListEntry>
    implements IArticleListAssembly {
  late final ArticleListRepository _repository;

  @override
  void initState() {
    _repository = ArticleListRepository(
      logger: widget.appAssembly.logger,
      api: widget.appAssembly.articlesApi,
      currentPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ArticleListWidgetComponent(
        incrementCurrentPageUseCase: incrementCurrentPageUseCase,
        loadArticleListUseCase: loadArticleListUseCase,
        getArticlesCountUseCase: getArticlesCountUseCase,
      );

  @override
  GetArticlesCountUseCase get getArticlesCountUseCase => _repository;

  @override
  IncrementCurrentPageUseCase get incrementCurrentPageUseCase => _repository;

  @override
  LoadArticleListUseCase get loadArticleListUseCase => _repository;
}
