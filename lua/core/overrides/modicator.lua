require('modicator').setup({
  show_warnings = true,
  highlights = {
    defaults = {
      bold = true,
    },
    modes = {
      ['i'] = { foreground = colors.green, },
      ['v'] = { foreground = colors.purple, },
      ['V'] = { foreground = colors.purple, },
      [''] = { foreground = colors.purple, },
      ['s'] = { foreground = colors.purple, },
      ['S'] = { foreground = colors.yellow, },
      ['R'] = { foreground = colors.orange, },
      ['c'] = { foreground = colors.red, },
    },
  },
})
