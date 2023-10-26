import 'package:flutter/material.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:mapper/src/widgets/list.dart';
import 'package:ui_kit/ui_kit.dart';

abstract class ListBlock extends Block<ListBlockModel> {
  const ListBlock(super.model);
}

class BulletedListBlock extends ListBlock {
  const BulletedListBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return CustomListView(
      items: model.items,
      buildMarker: (_, context) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Icon(
          Icons.circle,
          size: 8,
          color: AppColorScheme.of(context).onBackground,
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
      buildMarker: (index, context) => Text(
        '${index + 1}.',
        style: AppTextTheme.of(context).body.copyWith(
              color: AppColorScheme.of(context).onBackground,
            ),
      ),
    );
  }
}
