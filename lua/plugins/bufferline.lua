return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",        -- Show LSP diagnostics
        always_show_bufferline = false,  -- Hide when only one buffer open
        show_buffer_close_icons = false, -- Hide buffer tab close button
        show_close_icon = false,         -- Hide buffer main close button
      },
    })
  end,
}
