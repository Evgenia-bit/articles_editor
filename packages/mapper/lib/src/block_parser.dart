import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

class BlockParser {
  List<BlockModel> fromJson(Map<String, dynamic> json) {
    if(json['blocks'] is! List) return [];

    return (json['blocks'] as List).map(
      (block) => block['type']
    );
  }
}

final typeMap = {
  'heading': ParagraphBlockModel().fromJson()
};

