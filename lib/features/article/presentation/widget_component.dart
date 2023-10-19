import 'package:artus/features/article/domain/use_case.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/article/presentation/view.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:mapper/mapper.dart';

class ArticleWidgetComponent extends StatefulWidget {
  const ArticleWidgetComponent({
    required this.getArticleBlocksUseCase,
    super.key,
  });

  final GetArticleBlocksUseCase getArticleBlocksUseCase;

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
    blocks = widget.getArticleBlocksUseCase.blocks;
  }

  @override
  late final List<Block> blocks;
}
