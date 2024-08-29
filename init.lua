--                                         ▟▙            --
--                                         ▝▘            --
-- ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖--
-- ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██--
-- ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██--
-- ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██--
-- ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀--
-- Waldomiro Seabra

--{{{Packer
-- Install Packer if not installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
packadd cfilter
]]
require('packer').startup(function(use)

    -- Package manager
    use 'wbthomason/packer.nvim'

    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

    use 'preservim/nerdtree'

    use 'matze/vim-move' -- move text with <A-j> and <A-k>

    use 'inside/vim-search-pulse' -- pulse current line after search

    use 'tpope/vim-surround'

    use 'tpope/vim-sleuth'

    -- Git
    use 'tpope/vim-fugitive' -- :Git command

    use 'lewis6991/gitsigns.nvim' -- diff and hunk preview

    -- Themes

    use 'lifepillar/vim-solarized8'

    use 'mhinz/vim-startify' -- home for vim

    use 'mtdl9/vim-log-highlighting' -- highlight log files

    -- Statusline/tabline
    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'tpope/vim-dispatch' -- run async commands

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" }
    }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use 'RRethy/vim-illuminate' -- illuminate other instances of the current word

    use 'nvim-lua/lsp-status.nvim'
    use 'neovim/nvim-lspconfig' -- lsp defaults for nvim

    use { "williamboman/mason.nvim" } -- auto install lsp servers

    use 'williamboman/mason-lspconfig.nvim' -- integration between installer and defaults

    use 'hrsh7th/cmp-nvim-lsp' -- auto complete integration

    use 'hrsh7th/nvim-cmp' -- auto complete

    use 'j-hui/fidget.nvim' -- lsp status at the bottom right

    -- Snipets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use {
        'github/copilot.vim',
         tag = 'v1.27.0'
    }


    use 'liuchengxu/vista.vim' -- show functions and variables in a file

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        requires = { "nvim-treesitter/nvim-treesitter" },
        "Badhi/nvim-treesitter-cpp-tools",
    }

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    -- if is bootstrap sync everything otherwise just download new plugins
    if is_bootstrap then
        require('packer').sync()
    else
        require('packer').install()
    end
end)


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and install packages after saving this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source % | silent! LspStop | silent! LspStart | PackerInstall | source %',
    group = packer_group,
    pattern = 'init.lua',
})
--}}}

--{{{Set options
vim.opt.shell = "/bin/zsh" -- shell
vim.opt.cursorline = true -- show cursor line
vim.opt.colorcolumn = "80" -- color column 80
vim.opt.number = true -- show  (current)line number
vim.opt.relativenumber = true -- show relativenumber
vim.opt.signcolumn = "yes" -- force show signcolumn
vim.opt.autoread = true -- auto read buffer when edited outside vim
vim.opt.completeopt = "menuone,noselect" -- complete menu
vim.opt.pumheight = 10 -- complete menu itens to show before scrolling
vim.opt.grepprg = "rg --vimgrep" -- grep command
vim.opt.grepformat:append("%f:%l:%c:%m")
vim.opt.errorformat:append("%f:%l:%c:%m")
vim.opt.showcmd = true -- show cmd beeing typed
vim.opt.mouse = 'a' -- activate mouse
vim.opt.undofile = true -- activate undofaile
vim.opt.ignorecase = true -- ignorecase when searching
vim.opt.smartcase = true -- don't ignore case when capital case in search
vim.opt.hlsearch = true -- highlight during search
vim.opt.incsearch = true -- incremental search
vim.opt.updatetime = 250 --- decrease update time
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.api.nvim_create_autocmd('BufEnter',
    {
        pattern = 'init.lua,.vimrc',
        command = [[
    setlocal foldmethod=marker
    ]]
    })
vim.api.nvim_create_autocmd('BufRead',
    {
        pattern = 'init.lua,.vimrc',
        command = [[
    :normal zM
    ]]
    })

-- May remove with tpope/vim-sleuth
-- vim.opt.expandtab = true -- expand tab into spaces
-- vim.opt.shiftwidth = 4 -- size of indentation
-- vim.opt.tabstop = 4 -- size of tab

vim.opt.list = true
vim.opt.listchars = { eol = '¬', trail = '·', tab = '▸ ' } --show end of line and trailing whitespaces/tabs

vim.cmd('let loaded_spellfile_plugin = 0')

vim.opt.spelllang = "pt,en,es" -- spellcheck languages

-- disable default file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Theme options
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd [[colorscheme solarized8_high]]
--}}}

--{{{NvimTree
--require("nvim-tree").setup()
--}}}

--{{{vim-startify
vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
--}}}

--{{{Lualine
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()
require('lualine').setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
		{
		'diagnostics',
		symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
	}
	},
        lualine_c = {
            {
                'filename',
                path = 3,
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                path = 3,
            }
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
        'branch',
        'diff',
            {
                'buffers',
                mode = 4,
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { {'tabs', use_mode_colors = false} }
    },
    options = {
        component_separators = '',
        section_separators = '',
    },
}
---}}}

--{{{Comment.nvim
require('Comment').setup()
--}}}

--{{{Gitsigns
require('gitsigns').setup()
--}}}

--{{{Telescope
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        preview = false,
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require("telescope").load_extension("live_grep_args"))

--}}}

--{{{LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()
--}}}

--{{{Vista
vim.g.vista_default_executive = 'nvim_lsp'
--}}}

--{{{LSP

--servers
local servers = {}

-- require('fidget').setup({})
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = table.insert(servers, "sumneko_lua"),
}


local has_words_before = function()
    unpack = unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
    completion = {
        autocomplete = false,
    },
})


-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()


local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', '<Space>sdc', vim.lsp.buf.declaration,
        { desc = "[S]ymbol [D]e[C]laration ", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Space>sdf', vim.lsp.buf.definition,
        { desc = "[S]ymbol [D]e[F]inition", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Spaxe>si', vim.lsp.buf.implementation,
        { desc = "[S]ymbol [I]mplementation", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Space>sr', vim.lsp.buf.references,
        { desc = "[R]eferences of the symbol under the cursor", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Space>sh', vim.lsp.buf.hover,
        { desc = "[H]over", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Space>srn', vim.lsp.buf.rename,
        { desc = "[S]ymbol [R]e[N]ame", noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('n', '<Space>sa', vim.lsp.buf.code_action,
        { desc = "[S]ymbol [A]ction", noremap = true, silent = true, buffer = bufnr })

    vim.keymap.set('n', '<space>sf', function() vim.lsp.buf.format { async = true } end,
        { desc = "[S]uper [F]ormat", noremap = true, silent = true, buffer = bufnr })

    vim.api.nvim_create_autocmd('BufWritePre',
        {
            pattern = '*.c,*.cpp,*.cc,*.h,*.hpp',
            callback = function() vim.lsp.buf.format { async = false } end
        })
end

-- for _, serverName in ipairs(servers) do
--     require('lspconfig')[serverName].setup {
--         on_attach = on_attach,
--         capabilities = capabilities
--     }
-- end

require('lspconfig').clangd.setup {
    cmd = {'clangd-15', "--completion-style=detailed" },
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities
}
--}}}

--{{{Dispatch
vim.g.dispatch_no_maps = 1
--}}}

--{{{Copilot
vim.g.copilot_node_command="~/.nvm/versions/node/v16.19.0/bin/node"
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
--}}}
--{{{Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
--}}}
--{{{ Cpp Implement Methods Utils
require 'nt-cpp-tools'.setup({
    preview = {
        quit = 'q', -- optional keymapping for quit preview
        accept = '<tab>' -- optional keymapping for accept preview
    },
    header_extension = 'h', -- optional
    source_extension = 'cxx', -- optional
    custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = require'nt-cpp-tools.output_handlers'.get_add_to_cpp()
        }
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context) 
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
    }
})
--}}}

--{{{Local misc. functions and for keymaps
local SpellToggle = function()
    if vim.opt.spell:get() then
        vim.opt.spell = false
    else
        vim.opt.spell = true
    end
end

local RltvNrToggle = function()
    if vim.opt.relativenumber:get() then
        vim.opt.relativenumber = false
    else
        vim.opt.relativenumber = true
    end
end

local CallTelescope = function(method, opts)
    local theme = require('telescope.themes').get_ivy({ layout_config = {
        height = 10,
    }, })
    if opts then
        for k,v in pairs(theme) do opts[k] = v end
        method(opts)
        return
    end
    method(theme)
end
local notify = vim.notify

vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings detected for buffer, this is not supported yet") then
        return
    end

    notify(msg, ...)
end

local findNotes = function()
    local opts = {
        prompt_title = 'Notes',
        shorten_path = false,
        cwd = '~/notes',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        previewer = false,
    }
    CallTelescope(require('telescope.builtin').find_files,opts)
end

--}}}

--{{{Keymap
vim.keymap.set('n', '<Space><Space>', ':nohlsearch<CR>', { remap = false })
vim.keymap.set('n', '<F5>', RltvNrToggle, { desc = "Enable/Disable relativenumber", remap = false })
vim.keymap.set('n', '<F6>', SpellToggle, { desc = "Enable/Disable spell check (pt,en)", remap = false })
vim.keymap.set('n', '<F7>', ':NERDTreeToggle<CR>', { desc = "Open File Manager", remap = false })
vim.keymap.set('n', '<F8>', ':Vista!!<CR>', { desc = "Open Vista", remap = false })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to the panel above", remap = false })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to the panel bellow", remap = false })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to the panel left", remap = false })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to the panel right", remap = false })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = "Move to the panel above", remap = false })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = "Move to the panel bellow", remap = false })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = "Move to the panel left", remap = false })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = "Move to the panel right", remap = false })

vim.keymap.set('n', '<down>', 'gj', { desc = "Move down", remap = false })
vim.keymap.set('n', '<up>', 'gk', { desc = "Move up", remap = false })

-- Copilot wrote it's own map lol
vim.keymap.set('i', '<C-S>', '<C-R>=copilot#Accept("")<CR>', { desc = "Use copilot", remap = false })

-- Mnemonics

-- [T]ree[S]itter
-- shortcur for TSCppDefineClassFunc
vim.keymap.set('n', '<Space>tsd', ':TSCppDefineClassFunc<CR>', { desc = "Define class function ([T]ree[S]itter [D]efine)", remap = false })
vim.keymap.set('v', '<Space>tsd', ':TSCppDefineClassFunc<CR>', { desc = "Define class function ([T]ree[S]itter [D]efine)", remap = false })

-- [B]uffer
vim.keymap.set('n', '<Space>bn', ':bn<CR>', { desc = "Move to next buffer ([B]uffer [N]ext)", remap = false })
vim.keymap.set('n', '<Space>bp', ':bp<CR>', { desc = "Move to previous buffer ([B]uffer [P]revious)", remap = false })
vim.keymap.set('n', '<Space>bd', ':bd<CR>', { desc = "Delete buffer ([B]uffer [D]elete)", remap = false })

-- Quickfix (I don't have a good mnemonic for this, using the default [C])
vim.keymap.set('n', '<Space>cn', ':cn<CR>', { desc = "Next item in quickfix list", remap = false })
vim.keymap.set('n', '<Space>cp', ':cp<CR>', { desc = "Previous item in quickfix list", remap = false })

-- [G]it
vim.keymap.set('n', '<Space>gdt', require('gitsigns').diffthis, { desc = "[G]it [D]iff [T]his", remap = false })
vim.keymap.set('n', '<Space>gdh', function() require('gitsigns').diffthis('~') end,
    { desc = "[G]it [D]iff [H]EAD", remap = false })

vim.keymap.set('n', '<Space>gb', ':Git blame<CR>', { desc = "[G]it [B]lame", remap = false })

vim.keymap.set('n', '<Space>ghp', require('gitsigns').preview_hunk, { desc = "[G]it [H]unk [P]review", remap = false })
vim.keymap.set('n', '<Space>ghs', require('gitsigns').stage_hunk, { desc = "[G]it [H]unk [S]tage", remap = false })
vim.keymap.set('n', '<Space>ghu', require('gitsigns').undo_stage_hunk, { desc = "[G]it [H]unk [U]nstage", remap = false })

vim.keymap.set('n', '<Space>gfs', require('gitsigns').stage_buffer, { desc = "[G]it [F]ile [S]tage", remap = false })
vim.keymap.set('n', '<Space>gfu', ':Git restore --staged %<CR>', { desc = "[G]it [F]ile [U]nstage", remap = false })

vim.keymap.set('n', '<Space>gct', ':Git commit<CR>', { desc = "[G]it [C]ommit [T]his", remap = false })
vim.keymap.set('n', '<Space>gca', ':Git commit --amend<CR>', { desc = "[G]it [C]ommit [A]mend", remap = false })

vim.keymap.set('n', '<Space>gp', ':Git push<CR>', { desc = "[G]it [P]ush", remap = false })


-- [F]ind (Telescope)
vim.keymap.set('n', '<Space>fr', function() CallTelescope(require('telescope.builtin').oldfiles) end,
    { desc = '[F]in [R]ecently opened files' })
vim.keymap.set('n', '<Space>fb', function() CallTelescope(require('telescope.builtin').buffers) end,
    { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<Space>fk', function() CallTelescope(require('telescope.builtin').keymaps) end,
    { desc = '[F]ind [K]eymaps' })
-- vim.keymap.set('n', '<Space>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<Space>ff', function() CallTelescope(require('telescope.builtin').find_files) end,
    { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<Space>fp', function() CallTelescope(require('telescope.builtin').git_files) end,
    { desc = '[F]ind [P]roject Files' })
vim.keymap.set('n', '<Space>fh', function() CallTelescope(require('telescope.builtin').help_tags) end,
    { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<Space>fw', function() CallTelescope(require('telescope.builtin').grep_string) end,
    { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<Space>fg',
    function() CallTelescope(require('telescope').extensions.live_grep_args.live_grep_args) end,
    { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<Space>fd', function() CallTelescope(require('telescope.builtin').diagnostics) end,
    { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<Space>ft', function() CallTelescope(require('telescope.builtin').lsp_document_symbols) end,
    { desc = '[F]ind [T]ags' })
    -- Find notes with fn
vim.keymap.set('n', '<Space>fn', function() findNotes() end, { desc = '[F]ind [N]otes' })

vim.api.nvim_create_user_command('Q', ':q', { bang = true })
vim.api.nvim_create_user_command('Qa', ':qa', { bang = true })
vim.api.nvim_create_user_command('W', ':w', { bang = true })
vim.api.nvim_create_user_command('Wa', ':wa', { bang = true })
vim.api.nvim_create_user_command('Wq', ':wq', { bang = true })
vim.api.nvim_create_user_command('Wqa', ':wqa', { bang = true })

vim.api.nvim_create_user_command('A', ':ClangdSwitchSourceHeader', { bang = true })
--}}}
