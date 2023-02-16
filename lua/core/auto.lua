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
    "norg",
    "alpha"
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
    "norg",
    "alpha"
  },
  command = 'IndentBlanklineDisable'
})

-- disable extra tildas in certain files
a.nvim_create_autocmd('FileType', {
  pattern = '*',
  command = 'hi NonText guifg=bg'
})

-- source and compile lua conf when written
local packer_group = a.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile>',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
