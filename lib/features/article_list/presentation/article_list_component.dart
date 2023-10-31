import 'package:artus/features/article_list/data/models/article_list_item.dart';
import 'package:flutter/widgets.dart';

abstract class ArticleListComponent {
  List<ArticleListItem> get articles;
  String? get failureMessage;
  ScrollController get scrollController;
}
