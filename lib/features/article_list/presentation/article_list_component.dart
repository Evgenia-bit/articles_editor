import 'package:artus/features/article_list/domain/models/article_list_item.dart';
import 'package:flutter/widgets.dart';

abstract class ArticleListComponent {
  Exception? get failure;
  bool get loading;
  List<ArticleListItem> get articleList;
  ScrollController get scrollController;
}
