-- Paste from system clipboard using Ctrl+V ONLY while in Insert Mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from system clipboard' })

-- Buffer navigation with Alt+H and Alt+L
vim.keymap.set('n', '<M-l>', ':bnext<CR>')
vim.keymap.set('n', '<M-h>', ':bprevious<CR>')

-- To stop keyboard input and exit Terminal mode
vim.keymap.set('t', '<C-\\>', [[<C-\><C-n>]], { noremap = true })
