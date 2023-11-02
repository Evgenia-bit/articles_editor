import 'dart:convert';
import 'dart:math';
import 'package:api/src/api/articles/data/article_dto.dart';
import 'package:api/src/utils/safe_cast.dart';
import 'package:flutter/services.dart';

abstract interface class ArticlesApi {
  /// Returns a Record with a list of articles and the total count of articles.
  Future<(List<ArticleDto>, int)> getAll({int page, int limit});
  Future<ArticleDto?> getById(int id);
}

class ArticlesApiStub implements ArticlesApi {
  @override
  Future<(List<ArticleDto>, int)> getAll({
    int page = 0,
    int limit = 5,
  }) async {
    final allArticles = await _getData();
    final start = page * limit;
    final end = start + limit;
    final limitedArticles = allArticles
        .sublist(start, min(end, allArticles.length))
        .map(ArticleDto.fromJson)
        .toList();
    return (limitedArticles, allArticles.length);
  }

  @override
  Future<ArticleDto?> getById(int id) async {
    final articleList = await _getData();
    final article = articleList.where((a) => a['id'] == id).firstOrNull;
    if (article == null) return null;
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
