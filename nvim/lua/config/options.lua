-- Shell
vim.opt.shell = "/usr/bin/bash"

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.showcmd = true
vim.opt.termguicolors = true

-- List characters
vim.opt.list = true
vim.opt.listchars = { eol = '¬', trail = '·', tab = '▸ ' }

-- Mouse
vim.opt.mouse = 'a'

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion
vim.opt.completeopt = "menuone,noselect"
vim.opt.pumheight = 10

-- Files
vim.opt.autoread = true
vim.opt.undofile = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99

-- Grep
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat:append("%f:%l:%c:%m")
vim.opt.errorformat:append("%f:%l:%c:%m")

-- Timing
vim.opt.updatetime = 250

-- Spell
vim.opt.spelllang = "pt,en,es"

-- Disable default file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable spell file plugin
vim.cmd('let loaded_spellfile_plugin = 0')

-- Theme (set background, colorscheme loaded in ui.lua after plugin loads)
vim.opt.background = "dark"
