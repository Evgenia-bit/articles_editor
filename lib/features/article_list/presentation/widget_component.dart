import 'package:artus/common/data/models/article.dart';
import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:artus/features/article_list/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class ArticleListWidgetComponent extends StatefulWidget {
  const ArticleListWidgetComponent({
    required this.incrementCurrentPageUseCase,
    required this.getCurrentPageUseCase,
    required this.getScrollControllerUseCase,
    required this.loadArticlesUseCase,
    required this.getArticlesCountUseCase,
    super.key,
  });

  final IncrementCurrentPageUseCase incrementCurrentPageUseCase;
  final GetCurrentPageUseCase getCurrentPageUseCase;
  final GetScrollControllerUseCase getScrollControllerUseCase;
  final LoadArticlesUseCase loadArticlesUseCase;
  final GetArticlesCountUseCase getArticlesCountUseCase;

  @override
  State createState() => _ArticleListWidgetComponentState();
}

class _ArticleListWidgetComponentState
    extends ComponentState<ArticleListWidgetComponent, ArticleListComponent>
    implements ArticleListComponent {
  @override
  WidgetView<ArticleListComponent> buildView(BuildContext context) {
    return ArticleListView(this);
  }

  @override
  void initState() {
    super.initState();
    articles = widget.loadArticlesUseCase.loadArticles();
    scrollController = widget.getScrollControllerUseCase.scrollController;
    scrollController.addListener(_loadArticles);
  }

  @override
  late final List<Article> articles;

  @override
  late final ScrollController scrollController;

  void _loadArticles() {
    if (_isMaxScroll && !_isMaxArticlesCount) {
      widget.incrementCurrentPageUseCase.increment();
      final newArticles = widget.loadArticlesUseCase.loadArticles(
        page: widget.getCurrentPageUseCase.currentPage,
      );
      setState(() {
        articles.addAll(newArticles);
      });
    }
  }

  bool get _isMaxScroll =>
      scrollController.position.pixels ==
      scrollController.position.maxScrollExtent;

  bool get _isMaxArticlesCount =>
      widget.getArticlesCountUseCase.getCount == articles.length;
}
