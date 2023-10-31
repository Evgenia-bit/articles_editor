import 'package:artus/features/article_list/data/models/article_list_item.dart';

abstract interface class IncrementCurrentPageUseCase {
  int increment();
}

abstract interface class GetCurrentPageUseCase {
  int get currentPage;
}

abstract interface class LoadArticleListUseCase {
  Future<List<ArticleListItem>> loadArticles({int page, int limit});
}

abstract interface class GetArticlesCountUseCase {
  int get articlesCount;
}
