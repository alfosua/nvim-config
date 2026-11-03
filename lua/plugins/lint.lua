return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure linters by filetype
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        -- python = { "ruff" },
        -- markdown = { "markdownlint" },
      }

      -- Create autocmd to trigger linting
      local lint_augroup = vim.api.nvim_create_augroup("nvim-int", { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-lint" },
    opts = {
      -- This plugin accepts linters like eslint_d
      ensure_installed = { "eslint_d" },
    },
  },
}
