return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      css = { "biome" },
    },
    formatters = {
      biome = {
        -- Optional: customize command args if needed
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
      },
    },
    -- Optional: Set up format-on-save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
