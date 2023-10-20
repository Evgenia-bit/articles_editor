import 'package:mapper/src/block_parser.dart';
import 'package:mapper/src/mapper.dart';

export 'src/blocks/block.dart';
export 'src/blocks/heading_block.dart';
export 'src/blocks/image_block.dart';
export 'src/blocks/paragraph_block.dart';
export 'src/utils/safe_cast.dart';

final mapper = Mapper(blockParser: BlockParser());
