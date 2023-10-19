import 'package:artus/features/article/presentation/article_component.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: component.blocks
                .map((block) => block.buildWidget(context))
                .toList(),
          ),
        ),
      ),
    );
  }
}
