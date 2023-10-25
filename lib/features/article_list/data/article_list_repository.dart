import 'package:api/api.dart';
import 'package:artus/features/article_list/data/models/article_list_item.dart';
import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:flutter/widgets.dart';

class ArticleListRepository
    implements
        GetCurrentPageUseCase,
        IncrementCurrentPageUseCase,
        GetScrollControllerUseCase,
        LoadArticlesUseCase,
        GetArticlesCountUseCase {
  ArticleListRepository({
    required this.currentPage,
    required ArticlesApiStub api,
  }) : _api = api;

  final ArticlesApiStub _api;

  @override
  int currentPage;

  @override
  int increment() => currentPage++;

  @override
  ScrollController scrollController = ScrollController();

  @override
  int articlesCount = 0;

  @override
  Future<List<ArticleListItem>> loadArticles({
    int page = 0,
    int limit = 5,
  }) async {
    final (articles, count) = await _api.getAll(page: page, limit: limit);
    articlesCount = count;
    return articles.map(
      (a) => ArticleListItem(
        id: a.id,
        title: a.title,
        description: a.description,
        imageUrl: a.imageUrl,
      ),
    ).toList();
  }
}
