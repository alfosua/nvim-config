local function comment_insert(pos)
  local cs = vim.bo.commentstring
  if cs == "" then cs = "# %s" end
  local comment_part = cs:format(""):gsub("%s+$", "")

  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local indent = line:match("^%s*")

  if pos == "below" then
    vim.api.nvim_buf_set_lines(0, row, row, false, { indent .. comment_part .. " " })
    vim.api.nvim_win_set_cursor(0, { row + 1, #(indent .. comment_part .. " ") })
    vim.cmd("startinsert!")
  elseif pos == "above" then
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { indent .. comment_part .. " " })
    vim.api.nvim_win_set_cursor(0, { row, #(indent .. comment_part .. " ") })
    vim.cmd("startinsert!")
  elseif pos == "eol" then
    vim.api.nvim_set_current_line(line .. " " .. comment_part .. " ")
    vim.cmd("startinsert!")
  end
end

local function comment_insert_below() comment_insert("below") end
local function comment_insert_above() comment_insert("above") end
local function comment_insert_eol() comment_insert("eol") end

vim.keymap.set('n', 'gco', comment_insert_below, { desc = "Insert comment line below" })
vim.keymap.set('n', 'gcO', comment_insert_above, { desc = "Insert comment line above" })
vim.keymap.set('n', 'gcA', comment_insert_eol, { desc = "Insert comment line at the end of line" })
