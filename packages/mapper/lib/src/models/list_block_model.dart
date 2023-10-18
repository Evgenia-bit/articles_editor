import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

abstract class ListBlockModel extends BlockModel {
  abstract final bool isOrdered;
  abstract final List<ParagraphBlockModel> items;
}

class CustomListBlockModel extends ListBlockModel {
  @override
  final bool isOrdered;

  @override
  late final List<ParagraphBlockModel> items;

  CustomListBlockModel.fromJson(Map<String, dynamic>? json)
      : isOrdered = safeCast<bool>(json?['is_ordered']) ?? false {
    items = _itemsFromJson(json?['items']);
  }

  List<ParagraphBlockModel> _itemsFromJson(items) {
    final list = safeCast<List<Map<String, dynamic>>>(items);
    if (list == null) return [];
    return list.map(CustomParagraphBlockModel.fromJson).toList();
  }
}
