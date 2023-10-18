import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/image_block_model.dart';

class ImageBlock extends Block<ImageBlockModel> {
  ImageBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    if (model.url == null) return const SizedBox.shrink();
    
    return Image.network(
      model.url!,
      fit: BoxFit.contain,
    );
  }
}
