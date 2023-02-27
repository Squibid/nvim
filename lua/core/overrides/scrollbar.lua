require("scrollbar").setup({
  show = true,
  show_in_active_only = true,
  handle = {
    color = colors.bg_highlight,
  },
  marks = {
    Search = { color = colors.pink },
    Error = { color = colors.red },
    Warn = { color = colors.orange },
    Info = { color = colors.blue },
    Hint = { color = colors.grey2 },
    Misc = { color = colors.purple },
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "prompt",
    "TelescopePrompt",
    "noice",
    "alpha",
  },
  handlers = {
    diagnostic = true,
    gitsigns = true,
  }
})
