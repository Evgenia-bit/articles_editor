import 'package:artus/features/article/presentation/article_component.dart';

abstract interface class LoadArticleUseCase {
  Future<ArticleState> loadArticle();
}
