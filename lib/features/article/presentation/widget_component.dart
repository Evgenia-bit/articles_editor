import 'package:artus/features/article/domain/models/article_state.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ArticleWidgetComponent extends StatefulWidget {
  const ArticleWidgetComponent({
    required this.loadArticleUseCase,
    required this.failureDisplayer,
    super.key,
  });

  final LoadArticleUseCase loadArticleUseCase;
  final FailureDisplayer failureDisplayer;

  @override
  State createState() => _ArticleWidgetComponentState();
}

class _ArticleWidgetComponentState
    extends ComponentState<ArticleWidgetComponent, ArticleComponent>
    with SingleTickerProviderStateMixin
    implements ArticleComponent {
  @override
  WidgetView<ArticleComponent> buildView(BuildContext context) {
    return ArticleView(this);
  }

  @override
  void initState() {
    super.initState();
    _loadArticle();
  }

  @override
  ArticleState articleState = ArticleStateLoading();

  void _loadArticle() {
    widget.loadArticleUseCase.loadArticle().then((result) {
      setState(() {
        articleState = result;
      });

      if (result is ArticleStateData && result.failure != null) {
        widget.failureDisplayer.display(context, result.failure!);
      } else if (result is ArticleStateFailure) {
        widget.failureDisplayer.display(context, result.failure);
      }
    });
  }
}
