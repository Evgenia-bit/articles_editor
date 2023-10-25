import 'package:artus/features/article/data/models/article.dart';

abstract interface class GetArticleIdUseCase {
  int get articleId;
}

abstract interface class LoadArticleUseCase {
  Future<Article?> loadArticle();
}
