return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find files" },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = "Grep" },
      { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = "Buffers" },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = "Help" },
      { '<leader>fr', function() require('telescope.builtin').oldfiles() end, desc = "Recent files" },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          preview = false,
        },
      })
      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
