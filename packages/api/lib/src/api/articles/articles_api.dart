import 'dart:convert';
import 'package:api/src/api/articles/data/article_dto.dart';
import 'package:api/src/utils/safe_cast.dart';
import 'package:flutter/services.dart';

abstract interface class ArticlesApi {
  Future<List<ArticleDto>> getAll();
  Future<ArticleDto?> getById(int id);
}

class ArticlesApiStub implements ArticlesApi {
  @override
  Future<List<ArticleDto>> getAll() async {
    final articles = await _getData();
    return articles.map(ArticleDto.fromJson).toList();
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
