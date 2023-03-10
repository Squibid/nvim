local custom = require'lualine.themes.auto'

custom.normal = {
  a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.blue, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.blue, gui = 'bold' },
}
custom.insert = {
  a = { fg = colors.black, bg = colors.green, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.green, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.green, gui = 'bold' },
}
custom.replace = {
  a = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.orange, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.orange, gui = 'bold' },
}
custom.visual = {
  a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.purple, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.purple, gui = 'bold' },
}
custom.command = {
  a = { fg = colors.black, bg = colors.red, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.red, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.red, gui = 'bold' },
}
custom.terminal = {
  a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
  b = { fg = colors.black, bg = colors.grey, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.yellow, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.yellow, gui = 'bold' },
}
custom.inactive = {
  a = { bg = colors.black2 },
  b = { bg = colors.black2 },
  c = { bg = colors.black2 },
  x = { bg = colors.black2 },
  y = { bg = colors.black2 },
  z = { bg = colors.black2 },
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local function maximize_status()
  return require("true-zen.focus").running and '[M]' or '[]='
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'no-neck-pain',
        'alpha',
        'TelescopePrompt',
      },
      winbar = {},
    },
    theme = custom,
    always_divide_middle = false,
    globalstatus = true,
    refresh = {
      statusline = 500,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      { 'mode' },
      { 'filetype',
        color = { fg = colors.white, bg = colors.grey },
      },
      { 'filename',
        filestatus = true,
        path = 0,

        symbols = {
          modified = '[+]',
          readonly = '[=]',
          unnamed = 'No Name',
          newfile = '[New]',
        }
      }
    },
    lualine_b = {
      { 'diff',
        source = diff_source,
      },
      { 'diagnostics',
        sources = {'nvim_diagnostic', 'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
        symbols = {error = '[x]', warn = '[!]', info = '[i]', hint = '[?]'},
      }
    },
    lualine_c = {},
    lualine_x = {
      { 'fileformat',
        color = { gui = 'bold' }
      }
    },
    lualine_y = {
      { maximize_status },
    },
    lualine_z = { 'progress' }
  },
  inactive_sections = {
    lualine_x = {'location'},
  },
}
