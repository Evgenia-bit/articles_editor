import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/heading_block_model.dart';

class HeadingBlock extends Block<HeadingBlockModel> {
  HeadingBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return Text(
      model.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        // TODO(Evgenia-bit): import color from ColorScheme.
        color: const Color(0xFF000000), 
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        // TODO(Evgenia-bit): import font from Theme.
        fontSize: 20.0 * model.level, 
      ),
    );
  }
}
