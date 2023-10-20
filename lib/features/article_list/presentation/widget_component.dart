import 'package:artus/features/article_list/data/models/article.dart';
import 'package:artus/features/article_list/domain/use_case.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:artus/features/article_list/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class ArticleListWidgetComponent extends StatefulWidget {
  const ArticleListWidgetComponent({
    required this.getArticleListUseCase,
    super.key,
  });

  final GetArticleListUseCase getArticleListUseCase;

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
    articles = widget.getArticleListUseCase.articles;
  }

  @override
  late final List<Article> articles;
}
