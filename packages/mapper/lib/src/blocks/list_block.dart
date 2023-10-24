import 'package:flutter/material.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/widgets/list.dart';

abstract class ListBlock extends Block<ListBlockModel> {
  const ListBlock(super.model);
}

class BulletedListBlock extends ListBlock {
  const BulletedListBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return CustomListView(
      items: model.items,
      buildMarker: (_) => const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Icon(
          Icons.circle,
          size: 8,
        ),
      ),
    );
  }
}

class OrderedListBlock extends ListBlock {
  const OrderedListBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return CustomListView(
      items: model.items,
      buildMarker: (index, context) => Text('${index + 1}'),
    );
  }
}
