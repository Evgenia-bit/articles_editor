import 'package:artus/features/article/domain/models/article_state.dart';
import 'package:artus/features/article/presentation/article_component.dart';
import 'package:artus/features/common/widgets/failure_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return switch (component.articleState) {
      final ArticleStateData state => _StateDataView(state),
      ArticleStateLoading _ => _StateLoadingView(),
      final ArticleStateFailure _ => const FailureScreen(),
    };
  }
}

class _StateDataView extends StatelessWidget {
  final ArticleStateData state;
  const _StateDataView(this.state);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomAppBar(
              title: state.article.title,
              automaticallyImplyLeading: true,
            ),
            ...state.article.blocks.map(
              (block) => block.buildWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _StateLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
