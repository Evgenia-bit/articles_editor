import 'package:flutter/widgets.dart';
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

abstract class Block<T extends BlockModel> {
  final T model;

  const Block(this.model);

  Widget buildWidget(BuildContext context);
}

final Map<Type, Block<BlockModel> Function(BlockModel)> modelBlockMap = {
  CustomHeadingBlockModel: (model) => HeadingBlock(model as HeadingBlockModel),
  CustomParagraphBlockModel: (model) =>
      ParagraphBlock(model as ParagraphBlockModel),
  CustomListBlockModel: (model) =>
      listTypeMap[(model as ListBlockModel).listType]?.call(model) ??
      BulletedListBlock(model),
  CustomImageBlockModel: (model) => ImageBlock(model as ImageBlockModel),
  CustomVideoBlockModel: (model) => VideoBlock(model as VideoBlockModel),
};

final Map<ListType, ListBlock Function(ListBlockModel)> listTypeMap = {
  ListType.ordered: OrderedListBlock.new,
  ListType.bulleted: BulletedListBlock.new,
};
