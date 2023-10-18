import 'package:flutter/widgets.dart';
import 'package:mapper/src/block_parser.dart';
import 'package:mapper/src/blocks/block.dart';

class Mapper {
  final BlockParser _blockParser;

  Mapper({required BlockParser blockParser}) : _blockParser = blockParser;

  List<Widget> getWidgetsFromJson(
    Map<String, dynamic> json,
    BuildContext context,
  ) {
    final blockModels = _blockParser.fromJson(json);

    return blockModels
        .map(
          (model) => model == null
              ? const SizedBox.shrink()
              : Block(model).buildWidget(context),
        )
        .toList();
  }
}
