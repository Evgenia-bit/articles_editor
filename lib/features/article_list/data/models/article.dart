import 'package:mapper/mapper.dart';

class Article {
  final int id;
  late final HeadingBlock? title;
  late final ParagraphBlock? paragraph;
  final List<Block> blocks;

  Article.fromJson(Map<String, dynamic> json)
      : id = safeCast<int>(json['id']) ?? 0,
        blocks = mapper.getBlocksFromJson(json) {
    title = blocks.whereType<HeadingBlock>().firstOrNull;
    paragraph = blocks.whereType<ParagraphBlock>().firstOrNull;
  }
}
