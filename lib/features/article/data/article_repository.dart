import 'package:api/api.dart';
import 'package:artus/features/article/domain/models/article.dart';
import 'package:artus/features/article/domain/models/article_state.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus_logger/logger.dart';
import 'package:core/core.dart';

import 'package:mapper/mapper.dart';

class ArticleRepository implements LoadArticleUseCase {
  ArticleRepository({
    required int articleId,
    required ArticlesApi api,
    required Mapper mapper,
    required LogWriter logger,
  })  : _api = api,
        _mapper = mapper,
        _articleId = articleId,
        _logger = logger;

  final ArticlesApi _api;
  final Mapper _mapper;
  final int _articleId;
  final LogWriter _logger;

  @override
  Future<ArticleState> loadArticle() async {
    try {
      Failure? dataFailure;
      final articleDto = await _api.getById(_articleId);

      if (articleDto == null) throw ArticleNotFoundFailure();

      if (articleDto.title == null) {
        dataFailure = InvalidTitle();
        _logger.e(dataFailure);
      }

      return ArticleStateData(
        failure: dataFailure,
        article: Article(
          title: articleDto.title,
          blocks: _mapper.getBlocksFromJson(articleDto.blocks),
        ),
      );
    } on Failure catch (e) {
      _logger.e(e);
      return ArticleStateFailure(e);
    } on Exception catch (e) {
      _logger.e(e);
      return ArticleStateFailure(e);
    }
  }
}
