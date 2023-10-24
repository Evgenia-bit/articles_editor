import 'package:mapper/mapper.dart';

class Article {
  final String title;
  final List<Block> blocks;

  const Article({
    required this.title,
    required this.blocks,
  });
}
