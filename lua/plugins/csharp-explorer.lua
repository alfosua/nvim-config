return {
  "dtrh95/csharp-explorer.nvim", -- Replace with your actual repo
  dependencies = {
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("csharp-explorer").setup({
      -- your configuration here
    })
  end,
}
