import 'package:artus/features/article_list/domain/models/article_list_state.dart';
import 'package:flutter/widgets.dart';

abstract class ArticleListComponent {
  ArticleListState get articleListState;
  ScrollController get scrollController;
}
