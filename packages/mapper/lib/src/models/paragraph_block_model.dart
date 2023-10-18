import 'package:mapper/src/models/block_model.dart';

abstract class ParagraphBlockModel extends BlockModel {
  abstract final List<ParagraphItem> children;
}

abstract class ParagraphItem {
  abstract final String text;
  abstract final ParagraphItemStyle style;
}

abstract class ParagraphItemStyle {
  abstract final bool isBold;
  abstract final bool isItalic;
  abstract final bool isMonospaced;
}

class CustomParagraphBlockModel extends ParagraphBlockModel {
  @override
  late final List<ParagraphItem> children;

  CustomParagraphBlockModel.fromJson(Map<String, dynamic> json) {
    children = _childrenFromJson(json['children']);
  }

  List<ParagraphItem> _childrenFromJson(children) {
    return (children as List<Map<String, dynamic>>).map(CustomParagraphItem.fromJson).toList();
  }
}

class CustomParagraphItem extends ParagraphItem {
  @override
  final String text;
  @override
  final ParagraphItemStyle style;

  CustomParagraphItem.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String,
        style = CustomParagraphItemStyle.fromJson(json['style'] as Map<String, bool>);
}

class CustomParagraphItemStyle extends ParagraphItemStyle {
  @override
  final bool isBold;
  @override
  final bool isItalic;
  @override
  final bool isMonospaced;

  CustomParagraphItemStyle.fromJson(Map<String, bool> json)
      : isBold = json['is_bold'] ?? false,
        isItalic = json['is_italic'] ?? false,
        isMonospaced = json['is_monospaced'] ?? false;
}
