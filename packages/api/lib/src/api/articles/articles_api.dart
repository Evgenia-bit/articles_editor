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
    if (articles == null) return [];
    return articles.map(ArticleDto.fromJson).toList();
  }

  @override
  Future<ArticleDto?> getById(int id) async {
    final articleList = await _getData();
    final article = articleList?.firstWhere((a) => a['id'] == id);
    return ArticleDto.fromJson(article!);
  }

  Future<List<Map<String, dynamic>>?> _getData() async {
    final result = await rootBundle.loadString('packages/api/assets/data.json');
    final json = jsonDecode(result);
    return safeCast<List<dynamic>>(json)?.cast();
  }
}
