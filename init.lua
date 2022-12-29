local o = vim.opt
local g = vim.g
local a = vim.api
local cmd = vim.cmd

g.mapleader = " "

---------------
-- better ui --
---------------
o.number = true
o.relativenumber = true
o.numberwidth = 2 -- width o numberline
o.signcolumn = 'yes:1' -- show gutter
o.cursorline = true -- highlights the current line
o.scrolloff = 5 -- # lines below/above cursor
o.showmode = false -- stop vim from showing mode
o.cmdheight = 2 -- vim command height
o.mouse = "" -- no mouse

o.wrap = true -- wrap lines
o.linebreak = true -- fix where line is wraped
o.emoji = false -- something to do with the spacing of emojis
o.clipboard = 'unnamedplus' -- use system clipboard

-- intenting & tabing
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- colors
o.termguicolors = true
cmd('colorscheme jellybeans-nvim')

-- diagnostics
vim.diagnostic.config({
  underline = true,
  virtual_text = { prefix = '*', },
})

local colors = {
  black  = '#000000',
  black2 = '#161616',
  black3 = '#0E0E0E',
  black4 = '#101010',
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

-- width line
o.colorcolumn = { 80 }

-- custom opts
local copts = {
  tablines = 'colored', -- false, 'colored', and 'wrap'
  minimapcolor = colors.grey2,
}

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
o.pumblend = 3
o.pumheight = 20

o.wildignorecase = true
o.wildignore = '*.o'

-----------
-- netrw --
-----------
g.netrw_banner = 0
g.netrw_localcopydircmd = 'cp -r'
g.netrw_winsize = 30
g.netrw_liststyle = 1

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

-- start git messages in insert mode
a.nvim_create_autocmd('FileType', {
  group    = 'bufcheck',
  pattern  = { 'gitcommit', 'gitrebase', },
  command  = 'startinsert | 1'
})

-- return to last place
a.nvim_create_autocmd('BufRead', {
  pattern = '*',
  command = [[call setpos(".", getpos("'\""))]]
})

-- disable color column in certain files
a.nvim_create_autocmd('FileType', {
  pattern = {
    'netrw',
    "help",
    "term",
    "gitcommit",
    "packer",
    "vim",
    "Trouble",
    "norg"
  },
  command = 'set colorcolumn=0'
})

-- disable intent markers in certain files
a.nvim_create_autocmd('FileType', {
  pattern = {
    'netrw',
    "help",
    "term",
    "gitcommit",
    "packer",
    "vim",
    "Trouble",
    "norg"
  },
  command = 'IndentBlanklineDisable'
})

-- source and compile lua conf when written
local packer_group = a.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- telescope preview opts
a.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  command = 'setlocal number',
})

--------------
-- keybinds --
--------------
local opts = { noremap = true, silent = true }

-- greatest remap ever
a.nvim_set_keymap("n", "<leader>p", "\"_dP", opts)

-- open term buffer
a.nvim_set_keymap("n", "<leader>to", "<C-w>v<C-w>w:term<CR>", opts)

-- esc to go to normal mode in term bufers
a.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- open Trouble buffer
a.nvim_set_keymap("n", "<leader>tt", "<cmd>:TroubleToggle<CR>", opts)

-- open file viewer
a.nvim_set_keymap("n", "<leader>fo", ":Ex<CR>", opts)
a.nvim_set_keymap("n", "<leader>fs", ":Sex<CR>", opts)

-- clear search
a.nvim_set_keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- move selected text
a.nvim_set_keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
a.nvim_set_keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- keep cursor middle 
a.nvim_set_keymap("n", "<S-j>", "mzJ`z", opts) -- when combining lines
a.nvim_set_keymap("n", "n", "nzzzv", opts) -- searching
a.nvim_set_keymap("n", "N", "Nzzzv", opts)
a.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- half page jumping
a.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)

-- execute order 111
a.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- resizing splits 
a.nvim_set_keymap("n", '<C-h>', "<cmd>SmartResizeLeft<CR>", opts)
a.nvim_set_keymap("n", '<C-j>', "<cmd>SmartResizeDown<CR>", opts)
a.nvim_set_keymap("n", '<C-k>', "<cmd>SmartResizeUp<CR>", opts)
a.nvim_set_keymap("n", '<C-l>', "<cmd>SmartResizeRight<CR>", opts)

-- don't blame me pls
a.nvim_set_keymap("n", "<C-g>", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- telescope
a.nvim_set_keymap('n', '<leader>sf', '<cmd>Telescope find_files<CR>', opts)
a.nvim_set_keymap('n', '<leader>sg', '<cmd>Telescope git_commits<CR>', opts)
a.nvim_set_keymap('n', '<leader>sb',
  '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
a.nvim_set_keymap('n', '<leader>so', '<cmd>Telescope oldfiles<CR>', opts)
a.nvim_set_keymap('n', '<leader>sc', '<cmd>Telescope neoclip unnamed<CR>', opts)
a.nvim_set_keymap('n', '<leader>su', '<cmd>Telescope undo<CR>', opts)
a.nvim_set_keymap('n', '<leader>sd', '<cmd>Telescope diagnostics<CR>', opts)

-- auto comand keybinds
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
    bind('<ESC>', '<cmd>q<CR>') -- Close netrw
  end
})

-- vbox note taking
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    cmd[[setlocal ve=all]]

    -- draw a line on HJKL keystokes
    a.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
    a.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
    a.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
    a.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})

    -- draw a box by pressing "f" with visual selection
    a.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    -- make easier to navigate 
    o.cursorcolumn = true
    o.colorcolumn = { 0 }
  else
    cmd[[setlocal ve=]]
    cmd[[mapclear <buffer>]]
    vim.b.venn_enabled = nil
    o.cursorcolumn = false
    o.colorcolumn = { 80 }
  end
end
-- toggle keymappings for venn using <leader>v
a.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})

----------------
-- highlights --
----------------
-- indent line colors 
a.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = colors.red } )
a.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = colors.orange } )
a.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = colors.yellow } )
a.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = colors.green } )
a.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = colors.blue } )
a.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = colors.purple } )

-- code window
a.nvim_set_hl(0, 'CodewindowBorder', {fg = copts.minimapcolor})

a.nvim_set_hl(0, "ColorColumn", { bg = colors.grey }) -- color column
a.nvim_set_hl(0, "Pmenu", { bg = colors.black2 })
a.nvim_set_hl(0, "PmenuSel", { bg = colors.grey2 })
a.nvim_set_hl(0, "CursorLineNr", { fg = colors.white, bold = true })
a.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#ffffff", bg = "#1E1E1E" })
a.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#006fd8", bg = "#152f47" })
a.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#E9AD5A", bg = "#533221" })
a.nvim_set_hl(0, "DiagnosticVirtualTextError",
  { fg = "#ED3B44", bg = "#4b1313" })

-- cmp/treesitter stuff
a.nvim_set_hl(0, "CmpItemMenu", { fg = colors.purple, italic = true })

a.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "#A377BF", bold = true })
a.nvim_set_hl(0, "CmpItemKindText", { bg = "#63bc47", bold = true })
a.nvim_set_hl(0, "CmpItemKindField", { bg = "#db7093", bold = true })
a.nvim_set_hl(0, "CmpItemKindVariable", { bg = "#ff8c00", bold = true })
a.nvim_set_hl(0, "CmpItemKindEnum", { bg = "#FF5733", bold = true })
a.nvim_set_hl(0, "CmpItemKindFunction", { bg = "#483d8b", bold = true })
a.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "#FF339C", bold = true })
a.nvim_set_hl(0, "CmpItemKindProperty", { bg = "#4FBF63", bold = true })
a.nvim_set_hl(0, "CmpItemKindInterface", { bg = "#1e90ff", bold = true })
a.nvim_set_hl(0, "CmpItemKindClass", { bg = "#4D4C5C", bold = true })

a.nvim_set_hl(0, "TreesitterContext", { bg = colors.grey })

-- telescope
a.nvim_set_hl(0, "TelescopeMatching", { bg = colors.black3 })
a.nvim_set_hl(0, "TelescopeNormal", { bg = colors.black3 })

a.nvim_set_hl(0, "TelescopePreviewBorder", { bg = colors.black3 })
a.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.black3 })
a.nvim_set_hl(0, "TelescopePreviewTitle", { bg = colors.black3,
  fg = colors.black3 })

a.nvim_set_hl(0, "TelescopePromptBorder", { bg = colors.black2 })
a.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.black2 })
a.nvim_set_hl(0, "TelescopePromptPrefix", { bg = colors.black2 })
a.nvim_set_hl(0, "TelescopePromptTitle", { bg = colors.black2,
  fg = colors.black2 })

a.nvim_set_hl(0, "TelescopeResultsBorder", { bg = colors.black4 })
a.nvim_set_hl(0, "TelescopeResultsNormal", { bg = colors.black4 })
a.nvim_set_hl(0, "TelescopeResultsTitle", { bg = colors.black4,
  fg = colors.black4 })

a.nvim_set_hl(0, "TelescopeSelection", { bg = colors.black2 })
a.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = colors.black2,
  fg = colors.orange, bold = true })

----------------------
-- plugin functions --
----------------------
if copts.tablines == 'colored' then
  require("indent_blankline").setup {
    space_char_blankline = ' ',
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
    },
  }
elseif copts.tablines == 'wrap' then
  o.list = true
  require('indent_blankline').setup {
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
  }
else
  g.indent_blankline_char = ' '
end

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
    lualine_x = {'location'},
  },
}

-- completion
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(a.nvim_win_get_cursor(0))
  return col ~= 0 and a.nvim_buf_get_lines(0, line - 1, line, true)
    [1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  completion = { autocomplete = false, },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'luasnip', keyword_length = 3 },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3, max_item_count = 7 },
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
        Text = 'Tx',
        Snippet = '<>',
        Method = '  ',
        Function = '{}',
        Constructor = '  ',
        Field = '""',
        Variable = 'x=',
        Class = '~{',
        Interface = '.h',
        Module = '  ',
        Property = '@p',
        Unit = '  ',
        Value = '  ',
        Enum = 'E#',
        Keyword = '$1',
        Color = '  ',
        File = '  ',
        Reference = '  ',
        Folder = '  ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  ',
        Event = '  ',
        Operator = '  ',
        TypeParameter = '  ',
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
-- install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path})
    cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- I use the packer to manage the packer
  use 'wbthomason/packer.nvim'

  -- nice looking but useless
  use { 'metalelf0/jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' },
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'gorbit99/codewindow.nvim',
    config = function()
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
    end,
  }
  use { 'melkster/modicator.nvim',
    require('modicator').setup({
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
    })
  }

  -- useful
  use 'nvim-lualine/lualine.nvim'
  use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use 'jghauser/mkdir.nvim'
  use 'jbyuki/venn.nvim'
  use { 'nvim-neorg/neorg',
    tag = '*',
    ft = 'norg',
    run = ':Neorg sync-parsers',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
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
        }
      }
    end
  }
  use { 'folke/which-key.nvim',
    config = function()
      require("which-key").setup {
        icons = {
          breadcrumb = '>>',
          separator = '->',
        },
        window = { winblend = 3, },
        layout = { align = 'center', },
      }
    end
  }
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.load_extension('undo')
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
    end
  }
  use { 'AckslD/nvim-neoclip.lua',
    config = function()
      require('neoclip').setup {
        keys = { telescope = { i = { paste_behind = ' ' } } }
      }
    end
  }
  use { 'mrjones2014/smart-splits.nvim',
    requires = { 'kwkarlwang/bufresize.nvim',
      config = function() require("bufresize").setup() end
    },
    config = function()
      require('smart-splits').setup {
        resize_mode = { hooks = { on_leave = require('bufresize').register } }
      }
    end
  }

  -- gutter
  use { 'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }
  use { 'chentoast/marks.nvim',
    config = function() require('marks').setup() end
  }

  -- syntax related
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
  use { "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = false,
        fold_open = "v",
        fold_closed = ">",
        signs = {
          error = "[x]",
          warning = "[!]",
          hint = "[?]",
          information = "[i]"
        },
      }
    end
  }

  -- completion
  use { 'VonHeikemen/lsp-zero.nvim',
    config = function()
      local lsp = require('lsp-zero')
      lsp.set_preferences({
        suggest_lsp_servers = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = true,
        configure_diagnostics = true,
        cmp_capabilities = true,
        manage_nvim_cmp = false,
        call_servers = 'local',
        sign_icons = {
          error = 'x',
          warn = '!',
          hint = '?',
          info = 'i'
        }
      })
      lsp.setup()
    end
  }

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'lukas-reineke/cmp-under-comparator',
      { 'onsails/lspkind.nvim',
        config = function()
          require('lspkind').init()
        end
      },
    }
  }

  -- snippets
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

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use { 'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
