import 'package:mapper/mapper.dart';

class Article {
  final String title;
  final List<Block> blocks;

  const Article({
    required this.blocks,
    String? title,
  }) : title = title ?? '';
}
