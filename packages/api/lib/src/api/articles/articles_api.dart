import 'dart:convert';
import 'dart:math';
import 'package:api/src/api/articles/data/article_dto.dart';
import 'package:api/src/utils/safe_cast.dart';
import 'package:flutter/services.dart';

class ArticlesApi {
  /// Returns a list of articles and the total number of articles.
  Future<(List<ArticleDto>, int)> getAllArticles({
    int page = 0,
    int limit = 5,
  }) async {
    final articles = await _getData();
    if (articles == null) return (<ArticleDto>[], 0);
    try {
      final start = page * limit;
      final end = start + limit;
      final result = articles
          .sublist(start, min(end, articles.length))
          .map(ArticleDto.fromJSON)
          .toList();
      return (result, articles.length);
    } catch (_) {
      return (<ArticleDto>[], 0);
    }
  }

  Future<ArticleDto?> getArticleById(int id) async {
    final articleList = await _getData();
    final article = articleList.firstWhere((a) => a['id'] == id);
    return ArticleDto.fromJson(article);
  }

  Future<List<Map<String, dynamic>>> _getData() async {
    final result = await rootBundle.loadString('packages/api/assets/data.json');
    final json = jsonDecode(result);
    final articles =
        safeCast<List<dynamic>>(json)?.cast<Map<String, dynamic>>();
    if (articles == null) throw Exception('Incorrect data format: $json');
    return articles;
  }
}
