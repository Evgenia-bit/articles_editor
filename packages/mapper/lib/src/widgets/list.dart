import 'package:flutter/material.dart';
import 'package:mapper/src/blocks/paragraph_block.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

class CustomListView extends StatelessWidget {
  final Widget Function(int, BuildContext) buildMarker;
  final List<ParagraphBlockModel> items;

  const CustomListView({
    required this.items,
    required this.buildMarker,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            buildMarker(index, context),
            Expanded(
              child: ParagraphBlock(items[index]).buildWidget(context),
            ),
          ],
        );
      },
    );
  }
}
