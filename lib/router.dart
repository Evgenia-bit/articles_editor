import 'package:api/api.dart';
import 'package:artus/features/article/data/article_repository.dart';
import 'package:artus/features/article/presentation/widget_component.dart';
import 'package:artus/features/article_list/data/article_list_repository.dart';
import 'package:artus/features/article_list/presentation/widget_component.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mapper/mapper.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        // TODO(Evgenia-bit): add DI
        final repository = ArticleListRepository(
          currentPage: 0,
          api: ArticlesApiStub(),
        );
        return ArticleListWidgetComponent(
          incrementCurrentPageUseCase: repository,
          loadArticlesUseCase: repository,
          getArticlesCountUseCase: repository,
        );
      },
      routes: [
        GoRoute(
          path: 'article/:id',
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id'] ?? '');
            if (id == null) {
              return const SizedBox.shrink();
            }
            // TODO(Evgenia-bit): add DI
            final repository = ArticleRepository(
              articleId: id,
              api: ArticlesApiStub(),
              mapper: Mapper(blockParser: BlockParser()),
            );

            return ArticleWidgetComponent(
              loadArticleUseCase: repository,
            );
          },
        ),
      ],
    ),
  ],
);
