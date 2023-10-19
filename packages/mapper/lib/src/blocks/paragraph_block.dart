import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

class ParagraphBlock extends Block<ParagraphBlockModel> {
  ParagraphBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Color(0xFF000000)),
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
              fontFamily: child.style.isMonospaced ? 'RobotoMono' : null,
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
