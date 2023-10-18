import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/heading_block_model.dart';
import 'package:mapper/src/models/image_block_model.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/models/video_block_model.dart';

class BlockParser {
  List<BlockModel?> fromJson(Map<String, dynamic> json) {
    if (json['blocks'] is! List) return [];

    return (json['blocks'] as List).map((block) {
      if (block is! Map<String, dynamic>) return null;

      return typeMap[block['type']]
          ?.call(block['data'] as Map<String, dynamic>);
    }).toList();
  }
}

final typeMap = {
  'paragraph': CustomParagraphBlockModel.fromJson,
  'heading': CustomHeadingBlockModel.fromJson,
  'list': CustomListBlockModel.fromJson,
  'image': CustomImageBlockModel.fromJson,
  'video': CustomVideoBlockModel.fromJson,
};
