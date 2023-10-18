import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

class ParagraphBlock extends Block<ParagraphBlockModel> {
  ParagraphBlock(super.model);

  @override
  Widget buildWidget() {
    return RichText(
      text: TextSpan(
        children: _buildChildren(model.children),
      ),
    );
  }

  List<TextSpan> _buildChildren(List<ParagraphItem> children) {
    return model.children
        .map(
          (child) => TextSpan(
            text: child.text,
            style: TextStyle(
              fontWeight:
                  child.style.isBold ? FontWeight.bold : FontWeight.normal,
              fontStyle:
                  child.style.isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        )
        .toList();
  }
}
