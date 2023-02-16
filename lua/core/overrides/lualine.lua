local custom = require'lualine.themes.auto'

custom.normal = {
  a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
  b = { fg = colors.black, bg = colors.blue, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.blue, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.blue, gui = 'bold' },
}
custom.insert = {
  a = { fg = colors.black, bg = colors.green, gui = 'bold' },
  b = { fg = colors.black, bg = colors.green, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.green, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.green, gui = 'bold' },
}
custom.replace = {
  a = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  b = { fg = colors.black, bg = colors.orange, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.orange, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.orange, gui = 'bold' },
}
custom.visual = {
  a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
  b = { fg = colors.black, bg = colors.purple, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.purple, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.purple, gui = 'bold' },
}
custom.command = {
  a = { fg = colors.black, bg = colors.red, gui = 'bold' },
  b = { fg = colors.black, bg = colors.red, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.red, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.red, gui = 'bold' },
}
custom.terminal = {
  a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
  b = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
  c = { fg = colors.white, bg = colors.grey },
  x = {},
  y = { fg = colors.yellow, bg = colors.black2 },
  z = { fg = colors.black2, bg = colors.yellow, gui = 'bold' },
}
custom.inactive = {
  a = { bg = colors.grey },
  b = { bg = colors.grey },
  c = { bg = colors.grey },
  x = { bg = colors.grey },
  y = { bg = colors.grey },
  z = { bg = colors.grey },
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
  return vim.t.maximized and '[M]' or '[]='
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
    lualine_b = {},
    lualine_c = {
      { 'diff',
        source = diff_source,
      },
    },
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
