return {
  -- Colorscheme
  {
    'lifepillar/vim-solarized8',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme solarized8_high]])
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = '',
        section_separators = '',
      },
    },
  },
}
