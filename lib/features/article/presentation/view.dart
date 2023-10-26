import 'package:artus/features/article/presentation/article_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    final article = component.article;
    if (article == null) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomAppBar(
              title: article.title,
              automaticallyImplyLeading: true,
            ),
            ...article.blocks.map(
              (block) => block.buildWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}
