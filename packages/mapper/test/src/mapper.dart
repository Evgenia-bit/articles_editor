import 'package:mapper/src/block_parser.dart';
import 'package:mapper/src/blocks/heading_block.dart';
import 'package:mapper/src/blocks/image_block.dart';
import 'package:mapper/src/blocks/list_block.dart';
import 'package:mapper/src/blocks/paragraph_block.dart';
import 'package:mapper/src/blocks/video_block.dart';
import 'package:mapper/src/mapper.dart';
import 'package:mapper/src/models/list_block_model.dart';
import 'package:test/test.dart';

void main() {
  final mapper = Mapper(blockParser: BlockParser());
  group('Mapper should convert from json to block', () {
    const testText1 = 'test 1';
    const testText2 = 'test 2';
    test('heading', () {
      const level = 1;
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'heading',
            'data': {
              'text': testText1,
              'level': level,
            }
          }
        ],
      );
      final block = result.first;

      expect(block.runtimeType, HeadingBlock);
      expect((block as HeadingBlock).model.text, testText1);
      expect(block.model.level, level);
    });

    test('paragraph', () {
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'paragraph',
            'data': {
              'children': [
                {
                  'text': testText1,
                  'style': {
                    'is_bold': true,
                    'is_italic': true,
                    'is_monospaced': true
                  }
                },
                {
                  'text': testText2,
                  'style': {
                    'is_bold': false,
                    'is_italic': false,
                    'is_monospaced': false
                  }
                },
              ]
            }
          }
        ],
      );
      final block = result.first;
      expect(block.runtimeType, ParagraphBlock);
      expect((block as ParagraphBlock).model.children.length, 2);

      final firstItem = block.model.children.first;
      expect(firstItem.text, testText1);
      expect(firstItem.style.isBold, true);
      expect(firstItem.style.isItalic, true);
      expect(firstItem.style.isMonospaced, true);

      final lastItem = block.model.children.last;
      expect(lastItem.text, testText2);
      expect(lastItem.style.isBold, false);
      expect(lastItem.style.isItalic, false);
      expect(lastItem.style.isMonospaced, false);
    });
    test('bulleted list', () {
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'list',
            'data': {
              'type': 'BULLETED',
              'items': [
                {
                  'children': [
                    {
                      'text': testText1,
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                  ]
                },
                {
                  'children': [
                    {
                      'text': testText2,
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                  ]
                },
              ]
            }
          },
        ],
      );
      final block = result.first;
      expect(block.runtimeType, BulletedListBlock);
      expect((block as BulletedListBlock).model.listType, ListType.bulleted);
      expect(block.model.items.length, 2);
    });
    test('ordered list', () {
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'list',
            'data': {
              'type': 'ORDERED',
              'items': [
                {
                  'children': [
                    {
                      'text': testText1,
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                  ]
                },
                {
                  'children': [
                    {
                      'text': testText2,
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                  ]
                },
              ]
            }
          },
        ],
      );
      final block = result.first;
      expect(block.runtimeType, OrderedListBlock);
      expect((block as OrderedListBlock).model.listType, ListType.ordered);
      expect(block.model.items.length, 2);
    });

    test('image', () {
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'image',
            'data': {
              'url': testText1,
            }
          },
        ],
      );
      final block = result.first;
      expect(block.runtimeType, ImageBlock);
      expect((block as ImageBlock).model.url, testText1);
    });

    test('video', () {
      final result = mapper.getBlocksFromJson(
        [
          {
            'type': 'video',
            'data': {
              'url': testText1,
            }
          },
        ],
      );
      final block = result.first;
      expect(block.runtimeType, VideoBlock);
      expect((block as VideoBlock).model.url, testText1);
    });
  });
  test('Mapper should return an empty array if empty data is passed', () {
    final result = mapper.getBlocksFromJson([]);
    expect(result, []);
  });
  test('Mapper should return an empty array if incorrect data is passed', () {
    final result = mapper.getBlocksFromJson([
      {
        'type': 'incorrect',
      }
    ]);
    expect(result, []);
  });
}
