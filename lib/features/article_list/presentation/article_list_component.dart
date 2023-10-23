import 'package:artus/common/data/models/article.dart';
import 'package:flutter/widgets.dart';

abstract class ArticleListComponent {
  List<Article> get articles;
  ScrollController get scrollController;
}
