import 'package:mapper/mapper.dart';

class Article {
  late final String title;
  late final String? imageURL;
  final List<Block> blocks;

  Article({
    required this.title,
    required this.imageURL,
    required this.blocks,
  });
}
