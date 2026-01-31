local map = vim.keymap.set

-- Clear search highlight
map('n', '<leader><leader>', ':nohlsearch<CR>', { desc = "Clear search" })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = "Move left" })
map('n', '<C-j>', '<C-w>j', { desc = "Move down" })
map('n', '<C-k>', '<C-w>k', { desc = "Move up" })
map('n', '<C-l>', '<C-w>l', { desc = "Move right" })

-- Buffer navigation
map('n', '<leader>bn', ':bn<CR>', { desc = "Next buffer" })
map('n', '<leader>bp', ':bp<CR>', { desc = "Previous buffer" })
map('n', '<leader>bd', ':bd<CR>', { desc = "Delete buffer" })

-- Git
map('n', '<leader>gs', ':Git<CR>', { desc = "Git status" })
map('n', '<leader>gc', ':Git commit<CR>', { desc = "Git commit" })
map('n', '<leader>gp', ':Git push<CR>', { desc = "Git push" })

-- Typo forgiveness
vim.api.nvim_create_user_command('Q', ':q', { bang = true })
vim.api.nvim_create_user_command('W', ':w', { bang = true })
vim.api.nvim_create_user_command('Wq', ':wq', { bang = true })
