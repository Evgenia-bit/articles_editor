import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

abstract class ListBlockModel extends BlockModel {
  abstract final bool isOrdered;
  abstract final List<ParagraphBlockModel> items;
}

class CustomListBlockModel extends ListBlockModel {
  @override
  final bool isOrdered;

  @override
  late final List<ParagraphBlockModel> items;

  CustomListBlockModel.fromJson(Map<String, dynamic> json)
      : isOrdered = json['is_ordered'] as bool {
    items = _itemsFromJson(json['items']);
  }

  List<ParagraphBlockModel> _itemsFromJson(items) {
    return (items as List<Map<String, dynamic>>)
        .map(CustomParagraphBlockModel.fromJson)
        .toList();
  }
}
