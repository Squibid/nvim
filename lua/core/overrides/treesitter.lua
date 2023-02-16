require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'help',
    'c',
    'lua',
    'norg',
    'bash',
    'html',
    'make',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
