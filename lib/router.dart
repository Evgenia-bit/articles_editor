import 'package:artus/features/app/di/app_assembly.dart';
import 'package:artus/features/article/di/entry.dart';
import 'package:artus/features/article_list/di/entry.dart';
import 'package:artus/features/common/widgets/failure_screen.dart';
import 'package:go_router/go_router.dart';

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
                  return const FailureScreen();
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
