import 'package:artus/features/article/domain/models/article_state.dart';

abstract interface class LoadArticleUseCase {
  Future<ArticleState> loadArticle();
}
