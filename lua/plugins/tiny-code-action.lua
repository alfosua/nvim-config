-- Example lazy.nvim spec for tiny-code-action.nvim
return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  event = "LspAttach",
  opts = {
    backend = "vim",
    picker = "telescope",
  },
  config = function()
    require("tiny-code-action").setup({})

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.keymap.set({ "n", "x" }, "<leader>ca", function()
          require("tiny-code-action").code_action({})
        end, { buffer = args.buf, desc = "Code action" })
      end,
    })
  end,
}
