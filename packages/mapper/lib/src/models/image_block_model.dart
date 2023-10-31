import 'package:mapper/src/models/block_model.dart';

abstract class ImageBlockModel extends BlockModel {
  abstract final String url;
}

class CustomImageBlockModel extends ImageBlockModel {
  @override
  final String url;

  CustomImageBlockModel({required this.url});

  CustomImageBlockModel.fromJson(Map<String, dynamic>? json)
      : url = json?['url'] as String;
}
