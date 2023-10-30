import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ArticleWidgetComponent extends StatefulWidget {
  const ArticleWidgetComponent({
    required this.loadArticleUseCase,
    super.key,
  });

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
      setState(() {
        articleState = result;
      });
      if (result is ArticleStateData && result.warningMessage != null) {
        showWarningSnackBar(result.warningMessage!);
      }
    });
  }

  @override
  ArticleState articleState = ArticleStateLoading();

  void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextTheme.of(context).body,
        ),
      ),
    );
  }
}
