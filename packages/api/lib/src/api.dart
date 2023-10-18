class API {
  List<Map<String, List<Map<String, dynamic>>>> getAllArticles() {
    return [
      {
        'blocks': [
          {
            'type': 'heading',
            'data': {'text': 'Heading example', 'level': 3}
          },
          {
            'type': 'paragraph',
            'data': {
              'children': [
                {
                  'text': 'Paragraph item example',
                  'style': {
                    'is_bold': true,
                    'is_italic': true,
                    'is_monospaced': true
                  }
                },
                {
                  'text': 'Paragraph item example',
                  'style': {
                    'is_bold': false,
                    'is_italic': true,
                    'is_monospaced': false
                  }
                }
              ]
            }
          },
          {
            'type': 'list',
            'data': {
              'is_ordered': true,
              'items': [
                {
                  'children': [
                    {
                      'text': 'List item example',
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                    {
                      'text': 'List item example',
                      'style': {
                        'is_bold': false,
                        'is_italic': true,
                        'is_monospaced': false
                      }
                    }
                  ]
                },
                {
                  'children': [
                    {
                      'text': 'List item example',
                      'style': {
                        'is_bold': true,
                        'is_italic': true,
                        'is_monospaced': true
                      }
                    },
                    {
                      'text': 'List item example',
                      'style': {
                        'is_bold': false,
                        'is_italic': true,
                        'is_monospaced': false
                      }
                    }
                  ]
                }
              ]
            }
          },
          {
            'type': 'paragraph',
            'data': {
              'children': [
                {
                  'text': 'Paragraph item example',
                  'style': {
                    'is_bold': true,
                    'is_italic': true,
                    'is_monospaced': true
                  }
                },
                {
                  'text': 'Paragraph item example',
                  'style': {
                    'is_bold': false,
                    'is_italic': true,
                    'is_monospaced': false
                  }
                }
              ]
            }
          },
        ],
      },
    ];
  }

  Map<String, List<Map<String, dynamic>>> getArticleById() {
    return {
      'blocks': [],
    };
  }
}