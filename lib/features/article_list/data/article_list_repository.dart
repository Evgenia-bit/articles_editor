import 'package:api/api.dart';
import 'package:artus/features/article_list/domain/models/article_list_item.dart';
import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:artus_logger/logger.dart';

class ArticleListRepository
    implements
        GetCurrentPageUseCase,
        IncrementCurrentPageUseCase,
        LoadArticleListUseCase,
        GetArticlesCountUseCase {
  ArticleListRepository({
    required this.currentPage,
    required ArticlesApi api,
    required LogWriter logger,
  })  : _api = api,
        _logger = logger;

  final ArticlesApi _api;
  final LogWriter _logger;

  @override
  int currentPage;

  @override
  int increment() => currentPage++;

  @override
  int articlesCount = 0;

  @override
  Future<(List<ArticleListItem>?, Exception?)> loadArticles({
    int page = 0,
    int limit = 5,
  }) async {
    try {
      final (articles, count) = await _api.getAll(
        page: currentPage,
        limit: limit,
      );
      articlesCount = count;

      return (
        articles
            .map(
              (a) => ArticleListItem(
                id: a.id,
                title: a.title,
                description: a.description,
                imageUrl: a.imageUrl,
              ),
            )
            .toList(),
        null,
      );
    } on Exception catch (e) {
      _logger.e(e);
      return (null, e);
    }
  }
}
