import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block.dart';

class ParagraphBlock extends Block {
  late final TextAlign _textAlign;
  late final List<TextSpan> _children;

  ParagraphBlock.fromJson(Map<String, dynamic>? json) {
    _textAlign = _textAlignFromJson(json?['align']);
    _children = _childrenFromJson(json?['children']);
  }

  @override
  Widget get widget {
    return RichText(
      textAlign: _textAlign,
      text: TextSpan(
        children: _children,
      ),
    );
  }

  TextAlign _textAlignFromJson(alignIndex) {
    final index = alignIndex is int ? alignIndex : 0;
    return TextAlign.values[index];
  }

  List<TextSpan> _childrenFromJson(children) {
    if (children is! List) return [];

    return children.map((json) {
      if (json is! Map<String, dynamic>) return const TextSpan();
      return TextSpan(
        text: json['text'].toString(),
        style: _textStyleFromJson(json['style']),
      );
    }).toList();
  }

  TextStyle? _textStyleFromJson(json) {
    if (json is! Map<String, dynamic>) return null;

    int? colorCode;

    if (json['color'] is String) {
      colorCode = int.tryParse(json['color'] as String);
    }

    return TextStyle(
      fontWeight: json['is_bold'] == true ? FontWeight.bold : FontWeight.normal,
      fontStyle:
          json['is_italic'] == true ? FontStyle.italic : FontStyle.normal,
      decoration: TextDecoration.combine(
        [
          if (json['is_underline'] == true) TextDecoration.underline,
          if (json['is_strike'] == true) TextDecoration.lineThrough,
        ],
      ),
      color: colorCode != null ? Color(colorCode) : null,
      fontSize:
          json['font_size'] is double ? json['font_size'] as double : null,
    );
  }
}
