import 'package:flutter/material.dart';

class Mapper {
  List<Widget?> fromJson(Map<String, dynamic> json) {
    return json['blocks'].map((json) {
      final block = typeMap[json["type"]]?.call(json["data"]);

      return block?.widget;
    }).toList();
  }
}

final typeMap = {
  'paragraph': (Map<String, dynamic> json) => ParagraphBlock.fromJson(json),
  'quote': (Map<String, dynamic> json) => QuoteBlock.fromJson(json),
  'divider': (Map<String, dynamic> json) => DividerBlock(),
};

abstract class Block {
  Widget get widget;
}

class ParagraphBlock extends Block {
  final TextAlign _textAlign;
  late final List<TextSpan> _children;

  ParagraphBlock.fromJson(Map<String, dynamic> json)
      : _textAlign = TextAlign.values[json['align']] {
    _children = _childrenFromJson(json['children']);
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

  List<TextSpan> _childrenFromJson(List<Map<String, dynamic>> children) {
    return children
        .map(
          (json) => const TextSpan(),
        )
        .toList();
  }
}

class QuoteBlock extends Block {
  final Widget _paragraph;

  QuoteBlock.fromJson(Map<String, dynamic> json)
      : _paragraph = ParagraphBlock.fromJson(json).widget;

  @override
  Widget get widget => Row(
        children: [
          const SizedBox(
            width: 3,
            child: ColoredBox(color: Colors.black),
          ),
          _paragraph,
        ],
      );
}

class DividerBlock extends Block {
  DividerBlock();
  @override
  Widget get widget => const Divider();
}
