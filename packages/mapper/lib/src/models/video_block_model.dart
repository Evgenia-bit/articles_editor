import 'package:mapper/src/models/block_model.dart';

abstract class VideoBlockModel extends BlockModel {
  abstract final String url;
}

class CustomVideoBlockModel extends VideoBlockModel {
  @override
  final String url;

  CustomVideoBlockModel({required this.url});

  CustomVideoBlockModel.fromJson(Map<String, dynamic>? json)
      : url = json?['url'] as String;
}
