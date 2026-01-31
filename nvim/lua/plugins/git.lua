return {
  -- Git commands
  { 'tpope/vim-fugitive' },

  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    keys = {
      { '<leader>gh', function() require('gitsigns').preview_hunk() end, desc = "Preview hunk" },
      { '<leader>gb', function() require('gitsigns').blame_line() end, desc = "Blame line" },
    },
  },
}
