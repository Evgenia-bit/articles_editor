import 'dart:convert';

import 'package:api/src/api/articles/data/article_dto.dart';
import 'package:flutter/services.dart';
import 'package:mapper/mapper.dart';

class ArticlesApi {
  Future<List<ArticleDto>> getAllArticles() async {
    final articles = await _getData();
    if (articles == null) return [];
    try {
      return articles.map(ArticleDto.fromJSON).toList();
    } catch (_) {
      return [];
    }
  }

  Future<ArticleDto?> getArticleById(int id) async {
    final articleList = await _getData();

    try {
      final article = articleList?.firstWhere((a) => a['id'] == id);
      return ArticleDto.fromJSON(article!);
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> _getData() async {
    try {
      final result =
          await rootBundle.loadString('packages/api/assets/data.json');
      final json = jsonDecode(result);
      return safeCast<List<dynamic>>(json)?.cast();
    } catch (_) {
      return null;
    }
  }
}
