import 'package:api/api.dart';
import 'package:artus/features/article/domain/use_case.dart';

class ArticleRepository implements GetArticleIdUseCase, LoadArticleUseCase {
  ArticleRepository({
    required this.articleId,
    required ArticlesApiStub api,
  }) : _api = api;

  final ArticlesApiStub _api;

  @override
  int articleId;

  @override
  Future<ArticleDto?> loadArticle() async {
    return _api.getById(articleId);
  }
}
