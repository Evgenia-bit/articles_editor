import 'package:artus/features/article_list/domain/models/article_list_item.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:artus/features/common/widgets/failure_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/localizations.dart';
import 'package:ui_kit/ui_kit.dart';

class ArticleListView extends WidgetView<ArticleListComponent> {
  const ArticleListView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    if (component.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (component.failure != null) {
      return const FailureScreen(withAppBar: false);
    }

    return ColoredBox(
      color: AppColorScheme.of(context).background,
      child: SafeArea(
        child: ListView.separated(
          controller: component.scrollController,
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: component.articleList.length,
          itemBuilder: (context, index) => _ArticleListItem(
            article: component.articleList[index],
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}

class _ArticleListItem extends StatelessWidget {
  final ArticleListItem article;
  const _ArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: AppColorScheme.of(context).surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl != null)
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  article.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.title != null) ...[
                    Text(
                      article.title!,
                      style: textTheme.headlineSmall.copyWith(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  if (article.description != null) ...[
                    Text(
                      article.description!,
                      style: textTheme.body.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ReadButton(articleId: article.id),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadButton extends StatelessWidget {
  final int articleId;
  const _ReadButton({required this.articleId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return GestureDetector(
      onTap: () => context.go('/article/$articleId'),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ColoredBox(
            color: colorScheme.primary.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                AppLocalizations.of(context)!.readButtonText,
                textAlign: TextAlign.center,
                style: AppTextTheme.of(context).label.copyWith(
                      color: colorScheme.primary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
