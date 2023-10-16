import 'package:flutter/widgets.dart';
import 'package:mapper/src/models/block.dart';
import 'package:mapper/src/widgets/video.dart';

class VideoBlock extends Block {
  late final Uri? _uri;

  VideoBlock.fromJson(Map<String, dynamic>? json) {
    _uri = _urlFromJson(json?['url']);
  }

  @override
  Widget get widget {
    if (_uri == null) return const SizedBox.shrink();
    return Video(uri: _uri!);
  }

  Uri? _urlFromJson(url) {
    if (url is! String) return null;
    return Uri.tryParse(url);
  }
}
