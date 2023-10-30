import 'package:mapper/src/block_parser.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/blocks/heading_block.dart';
import 'package:mapper/src/blocks/image_block.dart';
import 'package:mapper/src/blocks/list_block.dart';
import 'package:mapper/src/blocks/paragraph_block.dart';
import 'package:mapper/src/blocks/video_block.dart';
import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/heading_block_model.dart';
import 'package:mapper/src/models/image_block_model.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/models/video_block_model.dart';

class Mapper {
  final BlockParser _blockParser;

  Mapper({required BlockParser blockParser}) : _blockParser = blockParser;

  List<Block> getBlocksFromJson(List<Map<String, dynamic>> json) {
    final blockModels = _blockParser.fromJson(json);
    final blocks = <Block>[];

    for (final model in blockModels) {
      final block = _getBlockByModel(model);
      if (block != null) blocks.add(block);
    }

    return blocks;
  }

  Block? _getBlockByModel<T extends BlockModel>(T model) {
    return (switch (model) {
      HeadingBlockModel _ => HeadingBlock(model),
      ParagraphBlockModel _ => ParagraphBlock(model),
      ListBlockModel _ => _getListBlock(model.listType, model),
      ImageBlockModel _ => ImageBlock(model),
      VideoBlockModel _ => VideoBlock(model),
      BlockModel() => null,
    }) as Block?;
  }

  ListBlock _getListBlock(ListType listType, ListBlockModel model) {
    return switch (listType) {
      ListType.ordered => OrderedListBlock(model),
      ListType.bulleted => BulletedListBlock(model),
    };
  }
}
