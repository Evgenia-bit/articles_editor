import 'package:api/api.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:mapper/mapper.dart';

class ArticleRepository implements GetArticleBlocksUseCase {
  ArticleRepository({required int articleId}) {
    blocks = _loadArticle(articleId);
  }

  @override
  List<Block> blocks = [];

  List<Block> _loadArticle(int id) {
    final json = api.getArticleById(id);
    if (json == null) return [];
    return mapper.getBlocksFromJson(json);
  }
}
