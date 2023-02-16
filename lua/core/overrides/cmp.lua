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
    { name = 'neorg' },
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
      local kind_icons = lspicons
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
