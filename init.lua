--                                         ▟▙            --
--                                         ▝▘            --
-- ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖--
-- ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██--
-- ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██--
-- ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██--
-- ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀--
-- Waldomiro Seabra

--{{{Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)

    -- Package manager
    use 'wbthomason/packer.nvim'

    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

    use 'tpope/vim-sleuth'

    -- Git
    use 'tpope/vim-fugitive'

    use 'lewis6991/gitsigns.nvim'

    -- Themes
    use 'tomasr/molokai'

    use 'ayu-theme/ayu-vim'

    use 'lifepillar/vim-solarized8'

    use {'dracula/vim', as = 'dracula'}

    -- Statusline/tabline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


    use 'neovim/nvim-lspconfig'

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
--}}}

--{{{Set options
vim.opt.shell="/bin/zsh" -- shell
vim.opt.cursorline=true -- show cursor line
vim.opt.colorcolumn="80" -- color column 80
vim.opt.number=true -- show  (current)line number
vim.opt.relativenumber=true -- show relativenumber
vim.opt.signcolumn = "yes" -- force show signcolumn
vim.opt.autoread=true -- autoread buffer when edited outside vim
vim.opt.completeopt="menuone,preview"
vim.opt.showcmd=true -- show cmd beeing typed
vim.opt.mouse='a' -- activate mouse
vim.opt.undofile = true -- activate undofaile
vim.opt.ignorecase = true -- ignorecase when searching
vim.opt.smartcase = true -- dont ignore case when capital case in search
vim.opt.hlsearch=true -- highlight during search
vim.opt.incsearch = true -- incremental search
vim.opt.updatetime = 250 --- decrease update time
vim.opt.foldmethod="syntax"
vim.opt.foldlevelstart=99
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
-- vim.opt.shiftwidth=4 -- size of identation
-- vim.opt.tabstop=4 -- size of tab

vim.opt.list=true
vim.opt.listchars = {eol = '¬', trail = '·'} --show end of line and trailing whitespaces/tabs

vim.opt.spelllang="pt,en" -- spellcheck languages

-- Theme options
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd [[colorscheme ayu]]
--}}}

--{{{Lualine
require('lualine').setup {
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                path=3,
            }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                path=3,
            }
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 4,
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
    options = {
        component_separators = '|',
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

--}}}
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', '<Space>r', vim.lsp.buf.references,{desc = "[R]eferences of the symbol under the cursor", noremap=true, silent=true, buffer=bufnr})
end

require('lspconfig').clangd.setup{
    cmd = {"clangd-12"},
    on_attach = on_attach,
}

--{{{Local functions for keymaps
local SpellToggle = function()
    if vim.opt.spell:get() then
        vim.opt.spell=false
    else
        vim.opt.spell=true
    end
end

local RltvNrToggle = function()
    if vim.opt.relativenumber:get() then
        vim.opt.relativenumber=false
    else
        vim.opt.relativenumber=true
    end
end
--}}}

--{{{Keymaps
vim.keymap.set('n','<Space>', ':nohlsearch<CR>', {remap = false})
vim.keymap.set('n','<F5>',RltvNrToggle, {desc = "Enable/Disable relativenumber", remap = false})
vim.keymap.set('n','<F6>',SpellToggle, {desc = "Enable/Disable spell check (pt,en)", remap = false})

vim.keymap.set('n','<C-h>','<C-w>h', {desc = "Move to the panel above", remap = false})
vim.keymap.set('n','<C-j>','<C-w>j', {desc = "Move to the panel bellow", remap = false})
vim.keymap.set('n','<C-k>','<C-w>k', {desc = "Move to the panel left", remap = false})
vim.keymap.set('n','<C-l>','<C-w>l', {desc = "Move to the panel right", remap = false})

vim.keymap.set('n','<down>','gj', {desc = "Move down", remap = false})
vim.keymap.set('n','<up>','gk', {desc = "Move up", remap = false})

-- Mnemonics

-- [B]uffer
vim.keymap.set('n','<Space>bn',':bn<CR>', {desc = "Move to next buffer ([B]uffer [N]ext)", remap = false})
vim.keymap.set('n','<Space>bp',':bp<CR>', {desc = "Move to previous buffer ([B]uffer [P]revious)", remap = false})
vim.keymap.set('n','<Space>bd',':bd<CR>', {desc = "Delete buffer ([B]uffer [D]elete)", remap = false})

-- Quickfix (I don't have a good mnemonic for this, using the default [C])
vim.keymap.set('n','<Space>cn',':cn<CR>', {desc = "Next item in quickfix list", remap = false})
vim.keymap.set('n','<Space>cp',':cp<CR>', {desc = "Previous item in quickfix list", remap = false})

-- [G]it
vim.keymap.set('n','<Space>gdt', require('gitsigns').diffthis, {desc = "[G]it [D]iff [T]his", remap = false})
vim.keymap.set('n','<Space>gdh', function() require('gitsigns').diffthis('~') end, {desc = "[G]it [D]iff [H]EAD", remap = false})

vim.keymap.set('n','<Space>gb', ':Git blame<CR>', {desc = "[G]it [B]lame", remap = false})

vim.keymap.set('n','<Space>ghp', require('gitsigns').preview_hunk, {desc = "[G]it [H]unk [P]review", remap = false})
vim.keymap.set('n','<Space>ghs', require('gitsigns').stage_hunk, {desc = "[G]it [H]unk [S]tage", remap = false})
vim.keymap.set('n','<Space>ghu', require('gitsigns').undo_stage_hunk, {desc = "[G]it [H]unk [U]nstage", remap = false})

vim.keymap.set('n','<Space>gfs', require('gitsigns').stage_buffer, {desc = "[G]it [F]ile [S]tage", remap = false})
vim.keymap.set('n','<Space>gfu', ':Git restore --staged %<CR>', {desc = "[G]it [F]ile [U]nstage", remap = false})

vim.keymap.set('n','<Space>gct', ':Git commit<CR>', {desc = "[G]it [C]ommit [T]his", remap = false})
vim.keymap.set('n','<Space>gca', ':Git commit --amend<CR>', {desc = "[G]it [C]ommit [A]mend", remap = false})

vim.keymap.set('n','<Space>gp', ':Git push<CR>', {desc = "[G]it [P]ush", remap = false})

-- [F]ind (Telescope)
vim.keymap.set('n', '<Space>fr', require('telescope.builtin').oldfiles, { desc = '[F]ind [R]ecently opened files' })
vim.keymap.set('n', '<Space>fb', require('telescope.builtin').buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<Space>fk', require('telescope.builtin').keymaps, { desc = '[F]ind [K]eymaps' })
-- vim.keymap.set('n', '<Space>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<Space>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<Space>fp', require('telescope.builtin').git_files, { desc = '[F]ind [P]roject Files' })
vim.keymap.set('n', '<Space>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<Space>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<Space>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<Space>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })

vim.api.nvim_create_user_command('Q',':q', {bang = true})
vim.api.nvim_create_user_command('Qa',':qa', {bang = true})
vim.api.nvim_create_user_command('W',':w', {bang = true})
vim.api.nvim_create_user_command('Wq',':wq', {bang = true})
vim.api.nvim_create_user_command('Wqa',':wqa', {bang = true})
--}}}
