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
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

local switch_the_truth = function ()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.fn.getline('.')
    local cdx = 0
    -- find the starting position of the word
    while col-cdx > 0 and vim.fn.getline(row):sub(col-cdx, col-cdx) ~= " " do
        cdx = cdx+1
    end
    -- move the cursor to the beggining of the word
    vim.api.nvim_win_set_cursor(0, {row, col-cdx})
    col = col-cdx
    cdx = 1
    -- determine if the word is `true` or `false` also 
    local is_false = false
    local is_true = false
    while (vim.fn.getline(row):sub(col+cdx, col+cdx) ~= " ") and cdx < #line do
        if (vim.fn.getline(row):sub(col+1, col+cdx) == "false") then
            is_false = true
            break
        end
        if (vim.fn.getline(row):sub(col+1, col+cdx) == "true") then
            is_true = true
            break
        end
        cdx = cdx+1
    end
    if (is_false) then
        vim.api.nvim_buf_set_text(0, row-1, col, row-1, col+cdx, { "true" })
        return
    end
    if (is_true) then
        vim.api.nvim_buf_set_text(0, row-1, col, row-1, col+cdx, { "false" })
        return
    end
    print(
        string.format("'%s'", vim.fn.getline(row):sub(col+1, col+cdx)),
        "does not express a 'boolean'"
    )
end

vim.keymap.set('n', '<leader>sb', switch_the_truth)
