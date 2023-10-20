import 'package:artus/features/article_list/data/models/article.dart';

abstract interface class GetArticleListUseCase {
  List<Article> get articles;
}
