-- Basics
vim.o.exrc = true                 -- Enable executing local lua files
vim.opt.signcolumn = "yes"        -- Always show sign column
vim.opt.clipboard = "unnamedplus" -- Yank to system clipboard
vim.opt.number = true             -- Show line numbers
vim.opt.colorcolumn = "80"        -- Vertical line (ruler)

-- Word wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "

-- Visible Whitespace	
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
  eol = '↴',
  space = '⋅'
}
