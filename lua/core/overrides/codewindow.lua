local codewindow = require('codewindow')
codewindow.setup({
  show_cursor = false,
  minimap_width = 15,
  window_border = 'single',
  exclude_filetypes = {
    "netrw",
    "help",
    "term",
    "gitcommit",
    "packer",
    "vim",
    "Trouble",
  },
})
codewindow.apply_default_keybinds()
