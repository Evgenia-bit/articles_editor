import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/heading_block_model.dart';
import 'package:mapper/src/models/image_block_model.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/models/video_block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

class BlockParser {
  List<BlockModel?> fromJson(Map<String, dynamic> json) {
    final list = safeCast<List<Map<String, dynamic>>>(json['blocks']);
    if (list == null) return [];

    return list.map((block) {
      final data = safeCast<Map<String, dynamic>>(block['data']);
      return typeMap[block['type']]?.call(data);
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
