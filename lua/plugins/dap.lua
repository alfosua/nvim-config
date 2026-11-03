return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Rich UI layout for debugging
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      opts = {},
      config = function(_, opts)
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup(opts)

        -- Automatically open/close UI when debugging starts/ends
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
      end,
    },

    -- Inline variable evaluation & virtual text directly in code buffers
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- Automatic adapter installation via Mason
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "mason-org/mason.nvim" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          "codelldb", -- For C, C++ and Rust
        },
      },
    },
  },

  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,          desc = "Continue / Start" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "Run to cursor" },
    { "<leader>dg", function() require("dap").goto__() end,            desc = "Go to line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end,         desc = "Step into" },
    { "<leader>dO", function() require("dap").step_over() end,         desc = "Step over" },
    { "<leader>do", function() require("dap").step_out() end,          desc = "Step out" },
    { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
    { "<leader>dr", function() require("dap").repl.toggle() end,       desc = "Toggle REPL" },
    { "<leader>dl", function() require("dap").run_last() end,          desc = "Run last" },
    { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle DAP UI" },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Set conditional breakpoint"
    },
  },

  config = function()
    local dap = require("dap")

    -- Set custom breakpoint signs with modern highlight styling
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition",
      { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "", -- or "◌", "⊘", "", "" depending on your Nerd Font
      texthl = "DapBreakpointRejected",
      linehl = "",
      numhl = "",
    })

    -- This automatically inherits the red, yellow, and cyan colors from your colorscheme
    vim.api.nvim_set_hl(0, "DapBreakpoint", { link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "DapStopped", { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2d3149" }) -- optional background highlight for the paused line
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { link = "DiagnosticWarn" })

    -- Launch configuration for C, C++, and Rust
    local codelldb_config = {
      {
        name = "Launch executable",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
      {
        name = "Attach to process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
    }

    dap.configurations.c = codelldb_config
    dap.configurations.cpp = codelldb_config
    dap.configurations.rust = codelldb_config
  end,
}
