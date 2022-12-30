if copts.tablines == 'colored' then
  require("indent_blankline").setup {
    space_char_blankline = ' ',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
  }
elseif copts.tablines == 'wrap' then
  o.list = true
  require('indent_blankline').setup {
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
  }
else
  g.indent_blankline_char = ' '
end
