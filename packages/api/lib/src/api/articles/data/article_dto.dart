import 'package:api/src/utils/safe_cast.dart';

class ArticleDto {
  final int id;
  final String title;
  final String description;
  final String? imageURL;
  final List<Map<String, dynamic>> blocks;

  ArticleDto.fromJSON(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = safeCast<String>(json['title']) ?? '',
        description = safeCast<String>(json['description']) ?? '',
        imageURL = safeCast<String>(json['image_url']),
        blocks = (json['blocks'] as List).cast();
}
