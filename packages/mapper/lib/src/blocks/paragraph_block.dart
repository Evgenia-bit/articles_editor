import 'package:flutter/material.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/paragraph_block_model.dart';
import 'package:mapper/src/utils/export_to_html.dart';
import 'package:ui_kit/ui_kit.dart';

const monospacedFontFamily = 'packages/mapper/RobotoMono';

class ParagraphBlock extends Block<ParagraphBlockModel> {
  ParagraphBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextTheme.of(context).body.copyWith(
              color: AppColorScheme.of(context).onBackground,
            ),
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
                  child.style.isMonospaced ? monospacedFontFamily : null,
              fontWeight:
                  child.style.isBold ? FontWeight.bold : FontWeight.normal,
              fontStyle:
                  child.style.isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        )
        .toList();
  }

  @override
  String accept(Visitor visitor) {
   return visitor.exportParagraphBlock(this);
  }
}
