import 'package:api/src/utils/safe_cast.dart';

class ArticleDto {
  final int id;
  final String title;
  final String description;
  final String? imageURL;
  final String? title;
  final String? description;
  final String? imageUrl;
  final List<Map<String, dynamic>> blocks;

  ArticleDto.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = safeCast<String>(json['title']),
        description = safeCast<String>(json['description']),
        imageUrl = safeCast<String>(json['image_url']),
        blocks = (json['blocks'] as List).cast();
}
