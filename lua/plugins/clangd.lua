return {
  name = "clangd-config",
  dir = vim.fn.stdpath("config"),
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
  },
  ft = { "c", "cpp", "objc", "objcpp", "cuda" },
  config = function()
    -- Native Neovim 0.11+ / 0.13+ LSP configuration API
    vim.lsp.config["clangd"] = {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        -- Allow clangd to query GCC/G++ binaries for system headers and defines
        "--query-driver=/usr/bin/gcc*,/usr/bin/g++*,/usr/bin/*gcc*,/usr/bin/*g++*",
      },
      root_markers = {
        -- Always prioritize compile databases & clang configs
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        -- Project root indicators
        "CMakeLists.txt",
        ".git",
        -- Fallbacks for non-git / plain make repos
        "Makefile",
        "makefile",
        "GNUmakefile",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    }

    vim.lsp.enable("clangd")
  end
}
