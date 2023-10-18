import 'package:mapper/src/block_parser.dart';
import 'package:mapper/src/blocks/block.dart';

class Mapper {
  final BlockParser _blockParser;

  Mapper({required BlockParser blockParser}) : _blockParser = blockParser;

  List<Block> getWidgetsFromJson(
    Map<String, dynamic> json,
  ) {
    final blockModels = _blockParser.fromJson(json);
    final blocks = <Block>[];

    for (final model in blockModels) {
      if (model == null) continue;
      blocks.add(Block(model));
    }

    return blocks;
  }
}
