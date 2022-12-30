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

require('lazy').setup({
  { 'metalelf0/jellybeans-nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-telescope/telescope.nvim',
    version = '0.1.*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    }
  },
  { 'gorbit99/codewindow.nvim' },
  { 'melkster/modicator.nvim' },
  { 'numToStr/Comment.nvim', config = true, },
  { 'jbyuki/venn.nvim' },
  { 'nvim-neorg/neorg',
    version = '*',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  { 'folke/which-key.nvim' },
  { 'AckslD/nvim-neoclip.lua' },
  { 'mrjones2014/smart-splits.nvim',
    dependencies = { 'kwkarlwang/bufresize.nvim', config = true, },
  },
  { 'lewis6991/gitsigns.nvim', config = true, },
  { 'chentoast/marks.nvim', config = true, },
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-context'
  },
  { 'nvchad/nvim-colorizer.lua' },
  { 'folke/trouble.nvim' },
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
})
