return {
  "kylechui/nvim-surround",
  version = "^4.0.0", -- Use for stability
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Put your configuration here
    })
  end
}
