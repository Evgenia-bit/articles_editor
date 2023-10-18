import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/video_block_model.dart';
import 'package:mapper/src/widgets/video.dart';

class VideoBlock extends Block<VideoBlockModel> {
  VideoBlock(super.model);

  @override
  Widget buildWidget() {
    final uri = Uri.parse(model.url);
    return Video(uri: uri);
  }
}
