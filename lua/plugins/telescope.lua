return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  version = '*', -- Recommended pinning to latest release
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended to increase performance
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { desc = desc })
    end

    map('<leader>ff', builtin.find_files, "Find files with Telescope")
    map('<leader>fg', builtin.live_grep, "Live grep with Telescope")
    map('<leader>fb', builtin.buffers, "Find buffers with Telescope")
    map('<leader>fh', builtin.help_tags, "Find help tags with Telescope")
  end,
}
