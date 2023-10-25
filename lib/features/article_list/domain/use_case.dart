import 'package:artus/features/article_list/data/models/article_list_item.dart';
import 'package:flutter/widgets.dart';

abstract interface class IncrementCurrentPageUseCase {
  int increment();
}

abstract interface class GetCurrentPageUseCase {
  int get currentPage;
}

abstract interface class GetScrollControllerUseCase {
  ScrollController get scrollController;
}

abstract interface class LoadArticlesUseCase {
  Future<List<ArticleListItem>> loadArticles({int page, int limit});
}

abstract interface class GetArticlesCountUseCase {
  int get articlesCount;
}
