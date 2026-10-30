return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" }, -- Lazy-load on these filetypes
  keys = {
    { "<leader>Rs", function() require("kulala").run() end,        desc = "Send request" },
    { "<leader>Ra", function() require("kulala").run_all() end,    desc = "Send all requests" },
    { "<leader>Rb", function() require("kulala").scratchpad() end, desc = "Open scratchpad" },
  },
  opts = {
    -- Add custom configuration options here
    global_keymaps = false,
  },
}
