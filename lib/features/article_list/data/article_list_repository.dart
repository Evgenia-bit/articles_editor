import 'package:api/api.dart';
import 'package:artus/common/data/models/article.dart';
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
  });

  @override
  int currentPage;

  @override
  int increment() => currentPage++;

  @override
  ScrollController scrollController = ScrollController();

  @override
  List<Article> loadArticles({
    int page = 0,
    int limit = 5,
  }) {
    final result = api.getAllArticles(page: page, limit: limit);
    try {
      return result.map(Article.fromJson).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  int get getCount => api.getCount;
  
}
