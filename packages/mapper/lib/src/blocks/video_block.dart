import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/video_block_model.dart';
import 'package:mapper/src/widgets/video.dart';

class VideoBlock extends Block<VideoBlockModel> {
  VideoBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    final uri = Uri.tryParse(model.url);
    if (uri == null) {
      return Image.asset(
        'packages/mapper/assets/no_video.png',
        width: 250,
      );
    }
    return Video(uri: uri);
  }
}
