return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Language Servers
        "cssls",  -- CSS
        "lua_ls", -- Lua
        "gopls",  -- Go
        "ols",    -- Odin
        "ts_ls",  -- TypeScript/JavaScript
        "zls",    -- Zig
        -- Linters
        "eslint",
        -- Formatters
        "biome",
      },
    },
  },
}
