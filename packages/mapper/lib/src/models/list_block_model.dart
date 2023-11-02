import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

abstract class ListBlockModel extends BlockModel {
  abstract final ListType listType;
  abstract final List<ParagraphBlockModel> items;
}

enum ListType {
  bulleted(),
  ordered();
}

const listTypeMap = {
  'BULLETED': ListType.bulleted,
  'ORDERED': ListType.ordered,
};

class CustomListBlockModel extends ListBlockModel {
  @override
  late final List<ParagraphBlockModel> items;

  @override
  final ListType listType;

  CustomListBlockModel({required this.items, required this.listType});

  CustomListBlockModel.fromJson(Map<String, dynamic>? json)
      : listType = listTypeMap[json?['type']]! {
    items = _itemsFromJson(json?['items']);
  }

  List<ParagraphBlockModel> _itemsFromJson(items) {
    final list = safeCast<List<dynamic>>(items)?.cast<Map<String, dynamic>>();
    if (list == null) return [];
    return list.map(CustomParagraphBlockModel.fromJson).toList();
  }
}
