return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    -- Optional configuration goes here
    require("rose-pine").setup({
      variant = "auto", -- auto, main, moon, or dawn
      styles = {
        bold = true,
        italic = true,
        transparency = true, -- Set to true for a transparent background
      },
    })

    -- Set the colorscheme after configuring options
    vim.cmd("colorscheme rose-pine")
  end,
}
