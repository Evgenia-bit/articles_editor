import 'package:mapper/src/models/block_model.dart';
import 'package:mapper/src/utils/safe_cast.dart';

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

  CustomParagraphBlockModel.fromJson(Map<String, dynamic>? json) {
    children = _childrenFromJson(json?['children']);
  }

  List<ParagraphItem> _childrenFromJson(children) {
    // ignore: omit_local_variable_types
    final List<Map<String, dynamic>>? list =
        safeCast<List<dynamic>>(children)?.cast();
    if (list == null) return [];
    return list.map(CustomParagraphItem.fromJson).toList();
  }
}

class CustomParagraphItem extends ParagraphItem {
  @override
  late final String text;
  @override
  final ParagraphItemStyle style;

  CustomParagraphItem.fromJson(Map<String, dynamic> json)
      : style = CustomParagraphItemStyle.fromJson(
          safeCast<Map<String, dynamic>>(json['style']),
        ) {
    text = json['text'] as String;
  }
}

class CustomParagraphItemStyle extends ParagraphItemStyle {
  @override
  final bool isBold;
  @override
  final bool isItalic;
  @override
  final bool isMonospaced;

  CustomParagraphItemStyle.fromJson(Map<String, dynamic>? json)
      : isBold = safeCast<bool>(json?['is_bold']) ?? false,
        isItalic = safeCast<bool>(json?['is_italic']) ?? false,
        isMonospaced = safeCast<bool>(json?['is_monospaced']) ?? false;
}
