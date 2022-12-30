require('modicator').setup {
  show_warnings = true,
  highlights = {
    modes = {
      ['i'] = colors.green,
      ['v'] = colors.purple,
      ['V'] = colors.purple,
      ['�'] = colors.purple,
      ['s'] = colors.yellow,
      ['S'] = colors.yellow,
      ['R'] = colors.orange,
      ['c'] = colors.red,
    }
  }
}
