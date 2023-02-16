-- make sure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup{
  { 'notjedi/nvim-rooter.lua', config = true },
  { 'tamton-aquib/essentials.nvim' },

	-- only the most useless plugins (some of these are also ui related)
	{ 'goolord/alpha-nvim' },
	{ 'gorbit99/codewindow.nvim' },
	{ 'alec-gibson/nvim-tetris' },
	{ 'kwakzalver/duckytype.nvim', config = true }, -- like monkey type
	{ 'melkster/modicator.nvim' },
	{ 'nyngwang/murmur.lua', config = true },
  { 'potamides/pantran.nvim' },
	--

  -- colorscheme / ui
  { 'metalelf0/jellybeans-nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'nvim-lualine/lualine.nvim' },
  { 'utilyre/barbecue.nvim',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
    config = true,
  },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'lewis6991/gitsigns.nvim', config = true, },
  { 'chentoast/marks.nvim', config = true, },
  { 'folke/which-key.nvim' },
  { 'mrjones2014/smart-splits.nvim',
    dependencies = { 'kwkarlwang/bufresize.nvim', config = true, },
  },
  { 'rcarriga/nvim-notify' },
  { 'declancm/maximize.nvim', config = true, },
  --

  -- careful the following plugins might be considered useful proceed with caution
  -- muh fzf
  { 'nvim-telescope/telescope.nvim',
    version = '0.1.*',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      'AckslD/nvim-neoclip.lua',
    }
  },
  --

  -- movement
  { 'pta2002/intellitab.nvim' },
  --

  -- debugging
  { 'numToStr/Comment.nvim', config = true, },
  { 'folke/trouble.nvim' },
  { 'folke/todo-comments.nvim', config = true, },
  --

  -- notes
  { 'jbyuki/venn.nvim' },
  { 'nvim-neorg/neorg',
    version = '*',
    ft = 'norg',
    build = ':Neorg sync-parsers',
  },
  { 'shortcuts/no-neck-pain.nvim',
    version = '*',
  },
  { 'ellisonleao/glow.nvim' },
  { 'Pocco81/high-str.nvim' },
  --

  -- cmp, lsp and syntax
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'm-demare/hlargs.nvim', config = true },
      'Wansmer/treesj',
    }
  },
  { 'lewis6991/hover.nvim' },
  { 'nvchad/nvim-colorizer.lua' },
  { 'VonHeikemen/lsp-zero.nvim' },
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'lukas-reineke/cmp-under-comparator',
      'onsails/lspkind.nvim',
    },
  },
  { 'L3MON4D3/LuaSnip',
    version = 'v1.*',
    dependencies = 'rafamadriz/friendly-snippets',
  },
  { 'doxnit/cmp-luasnip-choice' },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'windwp/nvim-autopairs', config = true, },
  --
}
