import 'package:api/api.dart';
import 'package:artus/features/article_list/data/models/article_list_item.dart';
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
    required Logger logger,
  })  : _api = api,
        _logger = logger;

  final ArticlesApi _api;
  final Logger _logger;

  @override
  int currentPage;

  @override
  int increment() => currentPage++;

  @override
  int articlesCount = 0;

  @override
  Future<(List<ArticleListItem>, String?)> loadArticles({
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
        null
      );
    } catch (e) {
      if (e is Exception) {
        _logger.e(e);
      } else {
        _logger.log(e);
      }

      return (<ArticleListItem>[], 'An error has occurred');
    }
  }
}
