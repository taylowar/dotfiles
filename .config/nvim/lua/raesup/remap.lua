-- Move leve the current file
vim.keymap.set('n', '<leader>pv', '<cmd>:Ex<CR>')

-- moves the selected block of code up(K) or down(J)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- becuase when you are doing vertical edit mode (ctrl v jj I)
-- you must exit with Esc for changes to take effect
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', '<Esc>')

-- make the current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>!%<CR>', { silent = true })

-- copy things into the system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- for substituting all occurances of a word
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/')

-- for jummping to symbol definition
vim.keymap.set('n', 'gd', vim.lsp.buf.declaration)
