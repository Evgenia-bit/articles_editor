import 'package:api/api.dart';
import 'package:artus/features/article/data/models/article.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/utils/exception.dart';
import 'package:mapper/mapper.dart';

class ArticleRepository implements LoadArticleUseCase {
  ArticleRepository({
    required this.articleId,
    required ArticlesApi api,
    required Mapper mapper,
  })  : _api = api,
        _mapper = mapper;

  final ArticlesApi _api;
  final Mapper _mapper;

  int articleId;

  @override
  Future<ArticleState> loadArticle() async {
    try {
      final articleDto = await _api.getById(articleId);
      if (articleDto == null) throw AppException('Article not found');

      return ArticleStateData(
        warningMessage: articleDto.title != null ? 'Invalid title' : null,
        article: Article(
          title: articleDto.title ?? '',
          blocks: _mapper.getBlocksFromJson(articleDto.blocks),
        ),
      );
    } on AppException catch (e) {
      return ArticleStateFailure(e.message);
    } catch (e) {
      return ArticleStateFailure();
    }
  }
}
