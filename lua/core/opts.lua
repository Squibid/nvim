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
o.laststatus = 3 -- global statusline

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

-- spelling
o.spelllang = { 'en_us' }

-- colors
o.termguicolors = true
cmd('colorscheme jellybeans-nvim')

-- diagnostics w/o virtual text
vim.diagnostic.config({
  underline = true,
  virtual_text = false
})

colors = {
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

lspicons = {
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
  File = '#`',
  Reference = '  ',
  Folder = '[/',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '%*',
  TypeParameter = '  ',
}

-- width line
o.colorcolumn = { 80 }

-- custom opts
copts = {
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

-----------------------
-- language settings --
-----------------------
g.c_syntax_for_h = true -- treat c header files as c files instead of c++ files

----------------
-- highlights --
----------------
-- transparent background
-- a.nvim_set_hl(0, "Normal", { bg = "" })

--
a.nvim_set_hl(0, "ColorColumn", { bg = colors.grey }) -- color column
a.nvim_set_hl(0, "Pmenu", { bg = colors.black2 })
a.nvim_set_hl(0, "PmenuSel", { bg = colors.grey2 })
a.nvim_set_hl(0, "CursorLineNr", { fg = colors.white, bold = true })

-- indent line colors 
a.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = colors.red } )
a.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = colors.orange } )
a.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = colors.yellow } )
a.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = colors.green } )
a.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = colors.blue } )
a.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = colors.purple } )

-- code window
a.nvim_set_hl(0, 'CodewindowBorder', {fg = copts.minimapcolor})

-- diagnostics
a.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#ffffff", bg = "#1E1E1E" })
a.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#006fd8", bg = "#152f47" })
a.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#E9AD5A", bg = "#533221" })
a.nvim_set_hl(0, "DiagnosticVirtualTextError",
  { fg = "#ED3B44", bg = "#4b1313" })

-- alpha start page 4chan edition
a.nvim_set_hl(0, "AlphaHeader", {fg = "#789922" })
a.nvim_set_hl(0, "AlphaEmphasis", {fg = "#DD0000" })

-- murmur (word highlights)
a.nvim_set_hl(0, "murmur_cursor_rgb", { bg = colors.grey2 })

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
a.nvim_set_hl(0, "CmpItemKindFile", { bg = "#E8D01C", bold = true })
a.nvim_set_hl(0, "CmpItemKindFolder", { bg = "#E8D01C", bold = true })
a.nvim_set_hl(0, "CmpItemKindOperator", { bg = "#E06C75", bold = true })

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
