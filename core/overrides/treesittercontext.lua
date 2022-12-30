require('treesitter-context').setup {
  enable = true,
  max_lines = 1,
  patterns = {
    default = {
      'function',
    },
  },
}
