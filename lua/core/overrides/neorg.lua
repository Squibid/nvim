require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {
      config = {
        dim_code_blocks = {
          width = 'content',
          padding = { right = 2, },
        },
        folds = false,
      }
    },
    ['core.norg.completion'] = {
      config = { engine = 'nvim-cmp', }
    },
    ['core.integrations.nvim-cmp'] = {},
  }
}
