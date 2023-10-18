import 'package:artus/features/article/presentation/article_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: component.widgetsList,
      ),
    );
  }
}
