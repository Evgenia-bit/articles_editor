import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/blocks/paragraph_block.dart';
import 'package:mapper/src/models/list_block_model.dart';

class ListBlock extends Block<ListBlockModel> {
  ListBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.items.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            if (model.isOrdered)
              Text('${index + 1}')
            else
              const Text(
                '\u2022',
                style: TextStyle(
                  color: Color(0xFF000000),
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              ),
            Expanded(
              child: ParagraphBlock(model.items[index]).buildWidget(context),
            ),
          ],
        );
      },
    );
  }
}
