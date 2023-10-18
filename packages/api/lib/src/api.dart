import 'package:api/src/data.dart';

class API {
  List<Map<String, dynamic>> getAllArticles() {
    return data;
  }

  Map<String, dynamic>? getArticleById(int id) {
    return data.where((article) => article['id'] == id).firstOrNull;
  }
}
