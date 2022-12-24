local o = vim.opt
local g = vim.g
local a = vim.api

g.mapleader = " "

---------------
-- better ui --
---------------
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true -- highlights the current line
o.scrolloff = 5 -- # lines below/above cursor
o.showmode = false -- stop vim from showing mode
o.cmdheight = 2 -- vim command height
o.mouse = "" -- no mouse

o.wrap = true -- wrap lines
o.linebreak = true
o.emoji = false
o.clipboard = 'unnamedplus' -- use system clipboard

-- intenting & tabing
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- width line
o.colorcolumn = { 80 } 
vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')

-- colors
o.termguicolors = true
vim.cmd('colorscheme jellybeans-nvim')

local colors = {
  black  = '#000000',
  black2 = '#161616',
  grey   = '#1E1E1E',
  grey2  = '#404040',
  white  = '#ffffff',
  red    = '#E06C75',
  orange = '#EA936C',
  yellow = '#E5C07B',
  green  = '#98C379',
  blue   = '#61AFEF',
  purple = '#C678DD',
}

-- custom opts
tablines = 'colored' -- false, colored, wrap
minimapcolor = colors.grey

------------
-- saving --
------------
o.swapfile = false
o.undofile = true
o.confirm = true

------------
-- search --
------------
o.ignorecase = true
o.smartcase = true
o.wrapscan = true
o.showmatch = true

----------------
-- wild menus --
----------------
o.wildoptions = 'pum'
o.pumblend = 10
o.pumheight = 20

o.wildignorecase = true
o.wildignore = '*.o'

-------------------
-- auto commands --
-------------------
a.nvim_create_augroup('bufcheck', {clear = true})

-- highlight yanks
a.nvim_create_autocmd('TextYankPost', {
  group    = 'bufcheck',
  pattern  = '*',
  callback = function() vim.highlight.on_yank{timeout = 250} end 
})

-- start terminal in insert mode
a.nvim_create_autocmd('TermOpen', {
  group    = 'bufcheck',
  pattern  = '*',
  command  = 'startinsert | set winfixheight'
})

-- close terminal buffers after shell dies
a.nvim_create_autocmd('TermClose', {
  group = 'bufcheck',
  pattern = 'term://*',
  command = 'call nvim_input("<CR>")'
})

-- close terminal buffer in normal mode
a.nvim_create_autocmd('FileType', {
  pattern = 'term://*',
  callback = function()
    vim.keymap.set('n', '<C-d>', '<cmd>q!<CR>', {remap = true, buffer = true})
  end
})

-- start git messages in insert mode
a.nvim_create_autocmd('FileType', {
  group    = 'bufcheck',
  pattern  = { 'gitcommit', 'gitrebase', },
  command  = 'startinsert | 1'
})

-- add some keybinds to the file view
a.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end 
    bind('h', '-^') -- Go up a directory
    bind('l', '<CR>') -- Go down a directory / open a file
    bind('.', 'gh') -- Toggle dotfiles
    bind('P', '<C-w>z') -- Close preview window
  end
})

-- return to last place
a.nvim_create_autocmd('BufRead', {
  pattern = '*',
  command = [[call setpos(".", getpos("'\""))]]
})

-- source and compile lua conf
local packer_group = a.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

--------------
-- keybinds --
--------------
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- esc to go to normal mode in term bufers
a.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", default_opts)

-- open term buffer
a.nvim_set_keymap("n", "<leader>to", "<C-w>v<C-w>w:term<CR>", default_opts)

-- open file viewer
a.nvim_set_keymap("n", "<C-e>", ":Ex<CR>", default_opts)
a.nvim_set_keymap("n", "<S-e>", ":Sex<CR>", default_opts)

-- clear search
a.nvim_set_keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- move selected text
a.nvim_set_keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", default_opts)
a.nvim_set_keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", default_opts)

-- keep cursor middle 
a.nvim_set_keymap("n", "<S-j>", "mzJ`z", default_opts) -- when combining lines
a.nvim_set_keymap("n", "n", "nzzzv", default_opts) -- searching
a.nvim_set_keymap("n", "N", "Nzzzv", default_opts)

-- execute order 111
a.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", default_opts)

-- Resizing panes
a.nvim_set_keymap("n", '<A-h>', "<cmd>SmartResizeLeft<CR>", default_opts)
a.nvim_set_keymap("n", '<A-j>', "<cmd>SmartResizeDown<CR>", default_opts)
a.nvim_set_keymap("n", '<A-k>', "<cmd>SmartResizeUp<CR>", default_opts)
a.nvim_set_keymap("n", '<A-l>', "<cmd>SmartResizeRight<CR>", default_opts)

-- moving between splits
a.nvim_set_keymap("n", '<C-h>', "<cmd>SmartCursorMoveLeft<CR>", default_opts)
a.nvim_set_keymap("n", '<C-j>', "<cmd>SmartCursorMoveDown<CR>", default_opts)
a.nvim_set_keymap("n", '<C-k>', "<cmd>SmartCursorMoveUp<CR>", default_opts)
a.nvim_set_keymap("n", '<C-l>', "<cmd>SmartCursorMoveRight<CR>", default_opts)

-- don't blame me pls
local title = "Nvim"
a.nvim_set_keymap("n", "<C-g>", 
  ":Gitsigns toggle_current_line_blame<CR>", default_opts
)

----------------------
-- plugin functions --
----------------------
a.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = colors.red } )
a.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = colors.orange } )
a.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = colors.yellow } )
a.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = colors.green } )
a.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = colors.blue } )
a.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = colors.purple } )

if tablines == 'colored' then
  require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
  }
elseif tablines == 'wrap' then
  o.list = true

  require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
else
  g.indent_blankline_char = ' ' 
end

-- minimap
a.nvim_set_hl(0, 'CodewindowBorder', {fg = minimapcolor})

-- lua line
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

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { "", },
      winbar = {},
    },
    theme = custom,
    always_divide_middle = false,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { 
      { 'filetype',
        color = { fg = colors.white, bg = colors.grey },
      },
      { 'filename',
        filestatus = true,
        path = 1,

        symbols = {
          modified = '[+]',
          readonly = '[=]',
          unnamed = 'No Name',
          newfile = '[New]',
        }
      }
    },
    lualine_c = { { 'diff', source = diff_source } },
    lualine_x = {
      { 'fileformat',
        color = { gui = 'bold' }
      }
    },
    lualine_y = {'progress'},
    lualine_z = {
      { 'location',
        padding = 1,
      }
    }
  },
  inactive_sections = {
    lualine_c = {'filename'},
    lualine_x = {'location'},
  },
}

a.nvim_set_hl(0, "PmenuSel", { bg = colors.grey2 })
a.nvim_set_hl(0, "Pmenu", { bg = colors.black2 })
a.nvim_set_hl(0, "CmpItemMenu", { fg = colors.purple, italic = true })
a.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "#A377BF", bold = true })
a.nvim_set_hl(0, "CmpItemKindText", { bg = "#63bc47", bold = true })

-- completion
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(a.nvim_win_get_cursor(0))
  return col ~= 0 and a.nvim_buf_get_lines(0, line - 1, line, true)
    [1]:sub(col, col):match("%s") == nil
end
local luasnip = require('luasnip')
local cmp = require('cmp')
local lspkind = require('lspkind')
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup {
  completion = { autocomplete = false, },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({ 
    { name = 'nvim-lsp', priority = 3, max_item_count = 5 }, 
    { name = 'luasnip', priority = 2, max_item_count = 3 }, 
    { name = 'path', priority = 1, max_item_count = 3 },
    { name = 'buffer' }, 
    { name = 'calc' },
  }),
  window = { 
    completion = { 
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    } 
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind_icons = {
        Text = "Tx",
        Snippet = "<>",
      }
      local menu_items = {
        buffer = "buffer",
        nvim_lsp = "LSP",
        luasnip = "luasnip",
        nvim_lua = "lua",
        calc = "calc",
      }

      vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind])
      vim_item.menu = string.format('     (%s)', menu_items[entry.source.name])

      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<ESC>'] = cmp.mapping.close(),
  }),
  sorting = {
    comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require "cmp-under-comparator".under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
    },
  },
  enabled = function()
    local context = require 'cmp.config.context'
    if a.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment") 
        and not context.in_syntax_group("Comment")
    end
  end
}

-------------
-- plugins --
-------------

-- install packer (stolen from nvim-lua/kickstart.nvim)
local install_path = vim.fn.stdpath 'data' .. 
  '/site/pack/packer/start/packer.nvim'
local bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 
    'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- use packer to manage packer :)
  use 'wbthomason/packer.nvim'
  
  -- the rest of the plugins
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lukas-reineke/virt-column.nvim',
    config = function()
      require('virt-column').setup()
    end
  }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvchad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        filetypes = { '*' },
          user_default_options = {
            names = false, 
            RRGGBBAA = true,
            AARRGGBB = true,
          },
      }
    end
  }
  use { 'nvim-treesitter/nvim-treesitter',
    config = function() 
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "help", "c", "lua", },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
    requires = {
      { 'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require'treesitter-context'.setup {
            enable = true,
            max_lines = 1,
            patterns = {
              default = {
                'function',
              },
            },
          }
        end
      },
    }

  }
  use 'b3nj5m1n/kommentary'
  use { 'metalelf0/jellybeans-nvim', 
    requires = { 'rktjmp/lush.nvim' },
  }
  use { 'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup({
        show_cursor = false,
        minimap_width = 15,
        window_border = 'double',
        exclude_filetypes = { 
          "netrw",
          "help",
          "term",
          "gitcommit",
          "packer",
          "vim",
        },
      })
      codewindow.apply_default_keybinds()
    end,
  }
  use 'jghauser/mkdir.nvim'
  use { 'lewis6991/gitsigns.nvim', 
    config = function() require('gitsigns').setup() end 
  }
  use { 'chentoast/marks.nvim', 
    config = function() require('marks').setup() end 
  }
  use { 'nacro90/numb.nvim', 
    config = function() require('numb').setup() end 
  }
  use { 'stevearc/stickybuf.nvim',
    config = function() require('stickybuf').setup() end
  }
  use 'mrjones2014/smart-splits.nvim'

  -- completion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'lukas-reineke/cmp-under-comparator',
      { 'onsails/lspkind.nvim',
        config = function()
          require('lspkind').init()
        end
      },
    }
  }
  use { 'L3MON4D3/LuaSnip',
    tag = 'v1.*',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  }
  use { 'doxnit/cmp-luasnip-choice',
    config = function()
      require('cmp_luasnip_choice').setup({
        auto_open = true,
      })
    end
  }
  use { 'windwp/nvim-autopairs', 
    config = function() require("nvim-autopairs").setup {} end
  }

  if bootstrap then
    require('packer').sync()
  end
end)
