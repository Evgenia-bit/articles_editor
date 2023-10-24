import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapper/src/blocks/block.dart';
import 'package:mapper/src/models/image_block_model.dart';

const _noImageAssetName = 'packages/mapper/assets/no_image.png';

class ImageBlock extends Block<ImageBlockModel> {
  ImageBlock(super.model);

  @override
  Widget buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Image.network(
        model.url,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            _noImageAssetName,
            width: 150,
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }
}
