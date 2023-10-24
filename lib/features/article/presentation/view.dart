import 'package:artus/features/article/presentation/article_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

const fontFamily = 'Roboto';

class ArticleView extends WidgetView<ArticleComponent> {
  const ArticleView(super.component, {super.key});

  @override
  Widget build(BuildContext context) {
    final article = component.article;
    if (article == null) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (article.imageURL != null)
              Stack(
                children: [
                  Image.network(
                    article.imageURL!,
                    fit: BoxFit.fitWidth,
                  ),
                  const Positioned(
                    top: 40,
                    left: 20,
                    child: _BackButton(),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 24,
                      fontFamily: fontFamily,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...article.blocks.map(
                    (block) => block.buildWidget(context),
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

class _BackButton extends StatelessWidget {
  const _BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 7, bottom: 10, left: 13),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
