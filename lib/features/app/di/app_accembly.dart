import 'package:api/api.dart';
import 'package:mapper/mapper.dart';

class AppAssembly implements IAppAssembly {
  late final ArticlesApi _articlesApi;
  late final BlockParser _blockParser;
  late final Mapper _mapper;

  @override
  ArticlesApi get articlesApi => _articlesApi;

  @override
  BlockParser get blockParser => _blockParser;

  @override
  Mapper get mapper => _mapper;

  AppAssembly() {
    _articlesApi = ArticlesApiStub();
    _blockParser = BlockParser();
    _mapper = Mapper(blockParser: _blockParser);
  }
}

abstract interface class IAppAssembly {
  ArticlesApi get articlesApi;
  Mapper get mapper;
  BlockParser get blockParser;
}
