import 'package:api/api.dart';

abstract interface class GetArticleIdUseCase {
  int get articleId;
}

abstract interface class LoadArticleUseCase {
  Future<ArticleDto?> loadArticle();
}
