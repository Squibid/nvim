local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    sorting_strategy = 'ascending',
    layout_config = {
      height = 0.9,
      prompt_position = 'top',
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-l>'] = actions.select_default,
        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
      },
      n = {
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
      },
    },
  }
}
telescope.load_extension('undo')
telescope.load_extension('file_browser')

a.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  command = 'setlocal number',
})
