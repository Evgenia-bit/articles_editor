/* class ParagraphItemBlock {
  final String _text;
  late final TextStyle _style;

  ParagraphItemBlock.fromJson(Map<String, dynamic> json)
      : _text = json['text'] {
    _style = _textStyleFromJson(json['style']);
  }

  TextSpan get textSpan => TextSpan(
        text: _text,
        style: _style,
      );

  TextStyle _textStyleFromJson(Map<String, dynamic> json) {
    return TextStyle(
      fontWeight: json['is_bold'] ? FontWeight.bold : FontWeight.normal,
      fontStyle: json['is_italic'] ? FontStyle.italic : FontStyle.normal,
      decoration: TextDecoration.combine(
        [
          if (json['is_underline']) TextDecoration.underline,
          if (json['is_strike']) TextDecoration.lineThrough,
        ],
      ),
      color: Color(json['color'].toInt()),
      fontSize: json['font_size'],
    );
  }
} 
 */