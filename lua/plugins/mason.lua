return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        -- Language Servers
        "bashls",        -- Bash
        "clangd",        -- C/C++
        "cssls",         -- CSS
        "lua_ls",        -- Lua
        "gopls",         -- Go
        "ols",           -- Odin
        "rust_analyzer", -- Rust
        "ts_ls",         -- JavaScript/TypeScript
        "zls",           -- Zig
        -- Linters
        "eslint",
        "biome",
      },
    },
  },
}
