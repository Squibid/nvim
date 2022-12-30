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
