import 'package:artus/features/article/data/models/article.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class ArticleWidgetComponent extends StatefulWidget {
  const ArticleWidgetComponent({
    required this.getArticleIdUseCase,
    required this.loadArticleUseCase,
    super.key,
  });

  final GetArticleIdUseCase getArticleIdUseCase;
  final LoadArticleUseCase loadArticleUseCase;

  @override
  State createState() => _ArticleWidgetComponentState();
}

class _ArticleWidgetComponentState
    extends ComponentState<ArticleWidgetComponent, ArticleComponent>
    implements ArticleComponent {
  @override
  WidgetView<ArticleComponent> buildView(BuildContext context) {
    return ArticleView(this);
  }

  @override
  void initState() {
    super.initState();
    widget.loadArticleUseCase.loadArticle().then((result) {
      setState(() async {
        article = result;
      });
    });
  }

  @override
  Article? article;
}
