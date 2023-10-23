import 'package:mapper/mapper.dart';

class Article {
  final int id;
  late final String title;
  late final String description;
  late final String? imageURL;
  final List<Block> blocks;

  Article.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = safeCast<String>(json['title']) ?? '',
        description = safeCast<String>(json['description']) ?? '',
        imageURL = safeCast<String>(json['image_url']),
        blocks = mapper.getBlocksFromJson(json);
}
