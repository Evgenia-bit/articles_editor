import 'package:artus/common/data/models/article.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleListView extends WidgetView<ArticleListComponent> {
  const ArticleListView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: ListView.separated(
          controller: component.scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: component.articles.length,
          itemBuilder: (context, index) => _ArticleListItem(
            article: component.articles[index],
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
  final Article article;
  const _ArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageURL != null)
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  article.imageURL!,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => context.go('/article/${article.id}'),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ColoredBox(
                          color: Color(0xffe9f2fb),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Перейти',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff0060d0),
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
