# Common Block Structure

-  `type`- block type, required, `String`.
-  `data`- block body, required, `Map<String, dynamic>`.   
- `compat`- the block that will be displayed if a old version is used, optional, `Map<String, dynamic>`.


## Header Block Structure

 - `type`: `header`
 - `data`
    - `text` - header content, required, `String`.
    - `level` - header level from 1 to 3, required, `int`. 

## Paragraph Block Structure

 - `type`: `paragraph`
 - `data`
    - `children` - paragraph text units with its own styles, required, `List<Map<String, dynamic>>`. Each paragraph item is a `Map<String, dynamic>` with the following fields:
        - `text` - content of the paragraph item, required, `String`.
        - `style` - style of the paragraph item, required, `Map<String, bool>`.
            - `is_bold`
            - `is_italic`
            - `is_monospaced`

## List Block Structure

- `type`: `list`
- `data`
    - `is_ordered` - indicate whether the list is ordered or unordered, required, `bool`.
    - `items` - items of the list, required, List<Map<String, dynamic>>. Each item corresponds to the value of the "data" field of the [paragraph](#paragraph-block-structure).


## Video Block Structure

- `type`: `video`
- `data`
     - `url` - video URL, required, `String`.

## Image Block Structure

- `type`: `image`
- `data`
     - `url` - image URL, required, `String`.
