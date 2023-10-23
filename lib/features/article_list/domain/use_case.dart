import 'package:artus/common/data/models/article.dart';
import 'package:flutter/widgets.dart';

abstract interface class GetArticleListUseCase {
  List<Article> get articles;
}

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
  List<Article> loadArticles({int page, int limit});
}

abstract interface class GetArticlesCountUseCase {
  int get getCount;
}
