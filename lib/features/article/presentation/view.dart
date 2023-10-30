import 'package:artus/features/article/presentation/article_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:ui_kit/ui_kit.dart';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    final child = switch (component.articleState) {
      final ArticleStateData state => _StateDataView(state),
      ArticleStateLoading _ => _StateLoadingView(),
      final ArticleStateFailure state => _StateFailureView(state),
    };

    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: SafeArea(child: child),
    );
  }
}

class _StateDataView extends StatelessWidget {
  final ArticleStateData state;
  const _StateDataView(this.state);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class _StateLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _StateFailureView extends StatelessWidget {
  final ArticleStateFailure state;
  const _StateFailureView(this.state);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CustomAppBar(
            title: '',
            automaticallyImplyLeading: true,
          ),
          Expanded(
            child: Center(
              child: Text(
                state.errorMessage ??
                    AppLocalizations.of(context)!.errorMessage,
                style: AppTextTheme.of(context).body.copyWith(
                      color: AppColorScheme.of(context).error,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
