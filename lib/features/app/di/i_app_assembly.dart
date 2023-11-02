import 'package:api/api.dart';
import 'package:artus_logger/logger.dart';
import 'package:core/core.dart';
import 'package:mapper/mapper.dart';

abstract interface class IAppAssembly {
  ArticlesApi get articlesApi;
  Mapper get mapper;
  BlockParser get blockParser;
  LogWriter get logger;
  FailureDisplayer get failureDisplayer;
}
