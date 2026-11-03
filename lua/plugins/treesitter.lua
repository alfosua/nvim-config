-- Useful commands:
-- - `:TSInstall <lang>`   -- Install or rebuild a specific parser
-- - `:TSUpdate`           -- Update all installed parsers
-- - `:TSUninstall <lang>` -- Remove a parser
-- - `:Inspect` / `:InspectTree`
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Ensure install these parsers
    require("nvim-treesitter").install {
      -- Common configuration
      "toml",
      "yaml",
      "xml",
      -- C / C++
      "c",
      "cmake",
      "cpp",
      "ninja",
      -- C# / .NET Development
      "c_sharp",
      "fsharp",
      -- Java Development
      "java",
      -- JavaScript / TypeScript Development
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "json",
      -- Markup, Rich-Text and Styling
      "html",
      "css",
      "markdown",
      "markdown_inline",
      -- Python Development
      "python",
      -- Shell, Extensions & Scripting
      "bash",
      "lua",
      "query",
      "vim",
      "vimdoc",
      -- System Programming
      "go",
      "rust",
      "zig",
    }
  end,
}
