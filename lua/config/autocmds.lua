-- Color whitespace characters
local function set_whitespace_hl()
  vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#383838" })
  vim.api.nvim_set_hl(0, "Whitespace", { fg = "#383838" })
  vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
end

set_whitespace_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_whitespace_hl,
})
