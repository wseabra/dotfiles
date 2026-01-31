-- Modern LSP setup for Nvim 0.11+
return {
  -- Mason for easy LSP server installation
  {
    'williamboman/mason.nvim',
    opts = {},
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      -- LSP keymaps (set when LSP attaches)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
          end

          map('gd', vim.lsp.buf.definition, "Go to definition")
          map('gD', vim.lsp.buf.declaration, "Go to declaration")
          map('gr', vim.lsp.buf.references, "Go to references")
          map('gi', vim.lsp.buf.implementation, "Go to implementation")
          map('K', vim.lsp.buf.hover, "Hover")
          map('<leader>rn', vim.lsp.buf.rename, "Rename")
          map('<leader>ca', vim.lsp.buf.code_action, "Code action")
          map('<leader>f', function() vim.lsp.buf.format({ async = true }) end, "Format")
        end,
      })

      -- Configure clangd
      vim.lsp.config('clangd', {
        cmd = { 'clangd', '--completion-style=detailed' },
      })

      -- Configure lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      -- Enable LSP servers
      vim.lsp.enable('clangd')
      vim.lsp.enable('lua_ls')
    end,
  },
}
