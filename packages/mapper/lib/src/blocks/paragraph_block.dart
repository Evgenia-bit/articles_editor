import 'package:flutter/material.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';

const String _monospacedFontFamily = 'RobotoMono';

class ParagraphBlock extends Block<ParagraphBlockModel> {
  ParagraphBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
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
              fontFamily:
                  child.style.isMonospaced ? _monospacedFontFamily : null,
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
