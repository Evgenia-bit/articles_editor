import 'package:api/api.dart';
import 'package:artus/features/article/data/models/article.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:mapper/mapper.dart';

class ArticleRepository implements GetArticleIdUseCase, LoadArticleUseCase {
  ArticleRepository({
    required this.articleId,
    required ArticlesApi api,
    required Mapper mapper,
  })  : _api = api,
        _mapper = mapper;

  final ArticlesApi _api;
  final Mapper _mapper;

  @override
  int articleId;

  @override
  Future<Article?> loadArticle() async {
    final articleDto = await _api.getById(articleId);
    if (articleDto == null) return null;
    return Article(
      title: articleDto.title ?? '',
      blocks: _mapper.getBlocksFromJson(articleDto.blocks),
    );
  }
}
