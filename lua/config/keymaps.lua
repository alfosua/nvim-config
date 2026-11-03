-- Paste from system clipboard using Ctrl+V ONLY while in Insert Mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from system clipboard' })

-- Buffer navigation with Alt+P (prev) and Alt+N (next)
vim.keymap.set('n', '<M-n>', ':bnext<CR>')
vim.keymap.set('n', '<M-p>', ':bprevious<CR>')
-- Close buffer with Alt+X
vim.keymap.set('n', '<M-x>', ':bdelete<CR>')

-- To stop keyboard input and exit Terminal mode
vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]], { noremap = true })
