vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- Ensure C-indent respects 2-space namespace indentation
vim.opt_local.cinoptions:remove("N-s")
vim.opt_local.cinoptions:remove("N")
