import 'package:mapper/src/models/block_model.dart';

abstract class ParagraphBlockModel extends BlockModel {}

class CustomParagraphBlockModel extends ParagraphBlockModel {
  late final List<ParagraphItem> _children;

  CustomParagraphBlockModel.fromJson(Map<String, dynamic> json) {
    _children = _childrenFromJson(json['children']);
  }

  List<ParagraphItem> _childrenFromJson(children) {
    if (children is! List<Map<String, dynamic>>) return [];
    return children.map((item) => ParagraphItem.fromJson(item)).toList();
  }
}

class ParagraphItem {
  final String _text;
  final ParagraphItemStyle _style;
  ParagraphItem.fromJson(Map<String, dynamic> json)
      : _text = json['text'] is String ? json['text'] as String : '',
      _style = json['style'];
} 


class ParagraphItemStyle {
  final bool _isBold;
  final bool _isItalic;
  final bool _isMonospaced;
  ParagraphItemStyle.fromJson(Map<String, bool> json);
}
