return {
  -- Commenting with gc
  { 'numToStr/Comment.nvim', opts = {} },

  -- Surround text objects
  { 'tpope/vim-surround' },

  -- OpenRouter completion (your plugin)
  {
    'wseabra/openrouter-complete-nvim',
    config = function()
      require("openrouter-complete").setup({
        model = "google/gemma-3n-e4b-it",
        enable_on_startup = true,
        auto_trigger = true,
        log_file = "~/log.txt",
        log_level = "debug"
      })
    end,
  },
}
