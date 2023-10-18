import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/list_block_model.dart';

class ListBlock extends Block<ListBlockModel> {
  ListBlock(super.model);

  @override
  Widget buildWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.items.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            if (model.isOrdered) Text('${index + 1}') else const Text('\u2022'),
            Block(model.items[index]).buildWidget(),
          ],
        );
      },
    );
  }
}
