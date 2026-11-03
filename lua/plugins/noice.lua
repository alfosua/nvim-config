return {
  "folke/noice.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MuniTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#00000000",
      },
    },
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use
      -- **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      --command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
  },
}
