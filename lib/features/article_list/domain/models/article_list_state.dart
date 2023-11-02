import 'package:artus/features/article_list/domain/models/article_list_item.dart';

class ArticleListState {
  bool isLoading;
  Exception? failure;
  List<ArticleListItem> articleList;

  ArticleListState({
    this.isLoading = true,
    this.failure,
    this.articleList = const [],
  });
}
