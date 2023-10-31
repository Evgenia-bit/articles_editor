import 'package:mapper/mapper.dart';
import 'package:mapper/src/utils/export_to_html.dart';
import 'package:test/test.dart';

void main() {
  final visitor = HtmlExportVisitor();
  group('HtmlExportVisitor should convert from block to html', () {
    test('heading', () {
      final block = HeadingBlock(
        CustomHeadingBlockModel(level: 1, text: 'Heading'),
      );
      final result = block.accept(visitor);

      expect(result, equals('<h1>Heading</h1>'));
    });

    test('paragraph', () {
      final block = ParagraphBlock(
        CustomParagraphBlockModel(
          children: [
            CustomParagraphItem(
              text: 'Test',
              style: CustomParagraphItemStyle(
                isBold: false,
                isItalic: false,
                isMonospaced: false,
              ),
            ),
            CustomParagraphItem(
              text: 'Test',
              style: CustomParagraphItemStyle(
                isBold: false,
                isItalic: false,
                isMonospaced: false,
              ),
            ),
          ],
        ),
      );
      final result = block.accept(visitor);

      expect(result, equals('<p>TestTest</p>'));
    });

    test('bulleted list', () {
      final block = BulletedListBlock(
        CustomListBlockModel(
          items: [
            CustomParagraphBlockModel(
              children: [
                CustomParagraphItem(
                  text: 'Test1',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
                CustomParagraphItem(
                  text: 'Test1',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
              ],
            ),
            CustomParagraphBlockModel(
              children: [
                CustomParagraphItem(
                  text: 'Test2',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
                CustomParagraphItem(
                  text: 'Test2',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
              ],
            ),
          ],
          listType: ListType.bulleted,
        ),
      );

      final result = block.accept(visitor);

      expect(
        result,
        equals('<ul><li><p>Test1Test1</p></li><li><p>Test2Test2</p></li></ul>'),
      );
    });

    test('ordered list', () {
      final block = OrderedListBlock(
        CustomListBlockModel(
          items: [
            CustomParagraphBlockModel(
              children: [
                CustomParagraphItem(
                  text: 'Test1',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
                CustomParagraphItem(
                  text: 'Test1',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
              ],
            ),
            CustomParagraphBlockModel(
              children: [
                CustomParagraphItem(
                  text: 'Test2',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
                CustomParagraphItem(
                  text: 'Test2',
                  style: CustomParagraphItemStyle(
                    isBold: false,
                    isItalic: false,
                    isMonospaced: false,
                  ),
                ),
              ],
            ),
          ],
          listType: ListType.ordered,
        ),
      );

      final result = block.accept(visitor);

      expect(
        result,
        equals('<ol><li><p>Test1Test1</p></li><li><p>Test2Test2</p></li></ol>'),
      );
    });

    test('image', () {
      final block = ImageBlock(CustomImageBlockModel(url: 'test'));
      final result = block.accept(visitor);

      expect(result, equals('<img src="test">'));
    });

    test('video', () {
      final block = VideoBlock(CustomVideoBlockModel(url: 'test'));
      final result = block.accept(visitor);

      expect(result, equals('<video><source src="test"></video>'));
    });
  });
}
