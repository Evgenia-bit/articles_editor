import 'package:artus/features/article/data/models/article.dart';
import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:mapper/mapper.dart';

class ArticleWidgetComponent extends StatefulWidget {
  const ArticleWidgetComponent({
    required this.getArticleIdUseCase,
    required this.loadArticleUseCase,
    required this.mapper,
    super.key,
  });

  final GetArticleIdUseCase getArticleIdUseCase;
  final LoadArticleUseCase loadArticleUseCase;
  final Mapper mapper;

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
    _setArticle();
  }

  @override
  Article? article;

  Future<void> _setArticle() async {
    final articleDto = await widget.loadArticleUseCase.loadArticle();
    if (articleDto == null) return;
    setState(() {
      article = Article(
        title: articleDto.title ?? '',
        blocks: widget.mapper.getBlocksFromJson(articleDto.blocks),
      );
    });
  }
}
