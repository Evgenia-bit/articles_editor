import 'package:mapper/mapper.dart';

abstract interface class Visitor {
  String exportHeadingBlock(HeadingBlock block);
  String exportParagraphBlock(ParagraphBlock block);
  String exportBulletedListBlock(BulletedListBlock block);
  String exportOrderedListBlock(OrderedListBlock block);
  String exportVideoBlock(VideoBlock block);
  String exportImageBlock(ImageBlock block);
}

class HtmlExportVisitor implements Visitor {
  @override
  String exportHeadingBlock(HeadingBlock block) {
    final level = block.model.level;
    return '<h$level>${block.model.text}</h$level>';
  }

  @override
  String exportImageBlock(ImageBlock block) {
    return '<img src="${block.model.url}">';
  }

  @override
  String exportBulletedListBlock(ListBlock block) {
    final items = block.model.items
        .map(
          (item) => '<li>${exportParagraphBlock(ParagraphBlock(item))}</li>',
        )
        .join();
    return '<ul>$items</ul>';
  }

  @override
  String exportOrderedListBlock(OrderedListBlock block) {
    final items = block.model.items
        .map(
          (item) => '<li>${exportParagraphBlock(ParagraphBlock(item))}</li>',
        )
        .join();
    return '<ol>$items</ol>';
  }

  @override
  String exportParagraphBlock(ParagraphBlock block) {
    final children = block.model.children.map((child) => child.text).join();
    return '<p>$children</p>';
  }

  @override
  String exportVideoBlock(VideoBlock block) {
    return '<video><source src="${block.model.url}"></video>';
  }
}
