import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/failed_block_model.dart';
import 'package:mapper/src/models/heading_block_model.dart';
import 'package:mapper/src/models/image_block_model.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/models/video_block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

class BlockParser {
  List<BlockModel> fromJson(Map<String, dynamic> json) {
    final blocks = safeCast<List<Map<String, dynamic>>>(json['blocks']);
    if (blocks == null) return [];

    return blocks.map((block) {
      final data = safeCast<Map<String, dynamic>>(block['data']);
      try {
        final model = typeMap[block['type']]?.call(data);
        return model ?? FailedBlockModel();
      } catch (_) {
        return FailedBlockModel();
      }
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
