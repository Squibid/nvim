require('toggleterm').setup {
  shade_terminals = true,
}

local Terminal  = require('toggleterm.terminal').Terminal
local glow = Terminal:new({
  cmd = "glow",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "shadow",
    width = 120,
    height = 50,
  }
})

function _glow()
  glow:toggle()
end
