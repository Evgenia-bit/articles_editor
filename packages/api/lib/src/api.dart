import 'dart:math';

import 'package:api/src/data.dart';

class API {
  List<Map<String, dynamic>> getAllArticles({
    int page = 0,
    int limit = 5,
  }) {
    final start = page * limit;
    final end = start + limit;
    return data.sublist(start, min(end, getCount));
  }

  int get getCount => data.length;

  Map<String, dynamic>? getArticleById(int id) {
    return data.where((article) => article['id'] == id).firstOrNull;
  }
}
