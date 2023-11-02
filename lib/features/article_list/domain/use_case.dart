import 'package:artus/features/article_list/domain/models/article_list_item.dart';

abstract interface class IncrementCurrentPageUseCase {
  int increment();
}

abstract interface class GetCurrentPageUseCase {
  int get currentPage;
}

abstract interface class LoadArticleListUseCase {
  /// The method returns a list of articles and an exception, if it occurred.
  Future<(List<ArticleListItem>?, Exception?)> loadArticles(
      {int page, int limit});
}

abstract interface class GetArticlesCountUseCase {
  int get articlesCount;
}
