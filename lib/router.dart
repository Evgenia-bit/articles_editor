import 'package:artus/features/app/di/app_accembly.dart';
import 'package:artus/features/article/di/entry.dart';
import 'package:artus/features/article_list/di/entry.dart';
import 'package:artus/features/common/widgets/failure_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:localizations/localizations.dart';

GoRouter router(AppAssembly appAssembly) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return ArticleListEntry(appAssembly: appAssembly);
          },
          routes: [
            GoRoute(
              path: 'article/:id',
              builder: (context, state) {
                final id = int.tryParse(state.pathParameters['id'] ?? '');
                if (id == null) {
                  return FailureScreen(
                    text: AppLocalizations.of(context)!.errorMessage,
                  );
                }
                return ArticleEntry(
                  appAssembly: appAssembly,
                  articleId: id,
                );
              },
            ),
          ],
        ),
      ],
    );
