import 'package:api/api.dart';
import 'package:artus/features/article/data/models/article.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/utils/exception.dart';
import 'package:artus_logger/logger.dart';
import 'package:mapper/mapper.dart';

class ArticleRepository implements LoadArticleUseCase {
  ArticleRepository({
    required this.articleId,
    required ArticlesApi api,
    required Mapper mapper,
    required Logger logger,
  })  : _api = api,
        _mapper = mapper,
        _logger = logger;

  final ArticlesApi _api;
  final Mapper _mapper;
  final Logger _logger;

  int articleId;

  @override
  Future<ArticleState> loadArticle() async {
    try {
      String? warningMessage;
      final articleDto = await _api.getById(articleId);

      if (articleDto == null) {
        throw AppException('Article not found');
      }

      if (articleDto.title == null) {
        warningMessage = 'Invalid title';
        _logger.w(warningMessage);
      }

      return ArticleStateData(
        warningMessage: warningMessage,
        article: Article(
          title: articleDto.title ?? '',
          blocks: _mapper.getBlocksFromJson(articleDto.blocks),
        ),
      );
    } on AppException catch (e) {
      _logger.e(e);

      return ArticleStateFailure(e.message);
    } catch (e) {
      if (e is Exception) {
        _logger.e(e);
      } else {
        _logger.log(e);
      }

      return ArticleStateFailure();
    }
  }
}
