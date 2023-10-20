import 'package:artus/features/article_list/data/models/article.dart';
import 'package:artus/features/article_list/presentation/article_list_component.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class ArticleListView extends WidgetView<ArticleListComponent> {
  const ArticleListView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: component.articles.length,
          itemBuilder: (context, index) => _ArticleListItem(
            article: component.articles[index],
          ),
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
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.title?.buildWidget(context) ?? const SizedBox.shrink(),
              const SizedBox(height: 10),
              Expanded(
                child: article.paragraph?.buildWidget(context) ??
                    const SizedBox.shrink(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
