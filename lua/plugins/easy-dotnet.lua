return {
  "GustavEikaas/easy-dotnet.nvim",
  ft = { "cs", "vb", "fsharp", "csproj", "sln" },
  dependencies = { "nvim-lua/plenary.nvim", 'folke/snacks.nvim', },
  config = function()
    require("easy-dotnet").setup()
  end
}
