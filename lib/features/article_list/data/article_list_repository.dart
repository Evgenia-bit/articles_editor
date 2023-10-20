import 'package:api/api.dart';
import 'package:artus/features/article_list/data/models/article.dart';
import 'package:artus/features/article_list/domain/use_case.dart';

class ArticleListRepository implements GetArticleListUseCase {
  ArticleListRepository() {
    articles = _loadArticleList();
  }

  @override
  List<Article> articles = [];

  List<Article> _loadArticleList() {
    final result = api.getAllArticles();
    return result.map(Article.fromJson).toList();
  }
}
