import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block.dart';
import 'package:mapper/src/models/paragraph_block.dart';

class ListBlock extends Block {
  final ListType _type;
  late final List<Widget> _items;

  ListBlock.fromJson(Map<String, dynamic>? json) : _type = ListType.ordered {
    _items = _itemsFromJson(json?['items']);
  }

  @override
  Widget get widget {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            switch (_type) {
              ListType.ordered => Text('${index + 1}'),
              _ => const Text('\u2022'),
            },
            _items[index],
          ],
        );
      },
    );
  }

  List<Widget> _itemsFromJson(items) {
    if (items is! List) return [];

    return items.map((item) {
      return ParagraphBlock.fromJson(item as Map<String, dynamic>?).widget;
    }).toList();
  }
}

enum ListType { ordered, unordered }
