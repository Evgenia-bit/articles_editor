import 'package:api/api.dart';
import 'package:artus/features/app/di/i_app_assembly.dart';
import 'package:artus_logger/logger.dart';
import 'package:core/core.dart';
import 'package:mapper/mapper.dart';

class AppAssembly implements IAppAssembly {
  late final ArticlesApi _articlesApi;
  late final BlockParser _blockParser;
  late final Mapper _mapper;
  late final LogWriter _logger;
  late final FailureDisplayer _failureDisplayer;

  @override
  ArticlesApi get articlesApi => _articlesApi;

  @override
  BlockParser get blockParser => _blockParser;

  @override
  Mapper get mapper => _mapper;

  @override
  LogWriter get logger => _logger;

  @override
  FailureDisplayer get failureDisplayer => _failureDisplayer;

  AppAssembly() {
    _articlesApi = ArticlesApiStub();
    _blockParser = BlockParser();
    _mapper = Mapper(blockParser: _blockParser);
    _logger = Logger.withStrategies({SimpleLogStrategy()});
    _failureDisplayer = FailureDisplayer(MessageController());
  }
}
